function c = catCell(a,b,varargin)
%Concatenates two cell arrays together. Allows for empty arrays
expectedOptions = {'v','h'};
defaultOption = 'v';
p = inputParser;
p.addRequired('a',@iscell);
p.addRequired('b',@iscell);
p.addParameter('mode',defaultOption,@(x)(any(validatestring(x,expectedOptions))));
p.parse(a,b,varargin{:});
if ((isempty(a))||((length(a)==1)&&isempty(a{:})))
    c = b;
elseif ((isempty(b))||((length(b)==1)&&isempty(b{:})))
    c = a;
else
    if(strcmp(p.Results.mode,'v'))
        assert(all(size(p.Results.a,2)==size(p.Results.b,2)),'Length of concatenated cells must be the same');
        c = [p.Results.a;p.Results.b];
    else 
      assert(all(size(p.Results.a,1)==size(p.Results.b,1)),'Height of concatenated cells must be the same');
     c = [p.Results.a,p.Results.b];
    end
end