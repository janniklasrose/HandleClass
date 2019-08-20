classdef(Abstract=true) HandleClass < handle
%HANDLECLASS Implements the handle class but hides its public methods
%   When defining a new class to be a subclass of handle (through
%   `classdef MyClass < handle`), all of its methods are inherited. However,
%   this may confuse the user when trying to auto-completing methods with
%   <TAB> after MyClass.___ and leads to clutter in the class reference
%   page (>> doc MyClass).
%
%   This class HandleClass is a subclass of the handle class, but hides all
%   the inherited methods. Functionality is preserved by passing the arguments
%   to the corresponding methods in the superclass handle. To benefit from
%   this, simply use HandleClass instead of handle in your class definitions
%   (i.e. classdef MyClass < HandleClass).
%
%   See also handle

%   Copyright (c) 2019 Jan N Rose

methods(Hidden=true) % override methods to hide them
    %% event methods

    % https://mathworks.com/help/matlab/ref/handle.addlistener.html
    function l = addlistener(varargin)
        l = addlistener@handle(varargin{:});
    end

    % https://mathworks.com/help/matlab/ref/handle.notify.html
    function notify(varargin)
        notify@handle(varargin{:});
    end

    %% find methods

    % https://mathworks.com/help/matlab/ref/handle.findobj.html
    function o = findobj(varargin)
        o = findobj@handle(varargin{:});
    end

    % https://mathworks.com/help/matlab/ref/handle.findprop.htm
    function p = findprop(varargin)
        p = findprop@handle(varargin{:});
    end

    %% relational operators

    % https://mathworks.com/help/matlab/ref/handle.relationaloperators.html
    function b = eq(varargin)
        b = eq@handle(varargin{:});
    end
    function b = ne(varargin)
        b = ne@handle(varargin{:});
    end
    function b = lt(varargin)
        b = lt@handle(varargin{:});
    end
    function b = le(varargin)
        b = le@handle(varargin{:});
    end
    function b = gt(varargin)
        b = gt@handle(varargin{:});
    end
    function b = ge(varargin)
        b = ge@handle(varargin{:});
    end

    %% IGNORE

    % https://mathworks.com/help/matlab/ref/handle.delete.html
    % Do not re-define this, otherwise errors involving deleted objects
    %   don't report correctly!
    %{
    function delete(varargin)
        delete@handle(varargin{:});
    end
    %}

    % https://mathworks.com/help/matlab/ref/handle.isvalid.html
    % Cannot re-define this, as it is a Sealed method from the superclass
    %   definition in @handle! Also a useful method to have.
    %{
    function b = isvalid(varargin)
        b = isvalid@handle(varargin{:});
    end
    %}

end

end
