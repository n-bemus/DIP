function y=alphatrimmed(x)
sortedx=sort(x);
y=sum(sortedx(5:20,:))/15;