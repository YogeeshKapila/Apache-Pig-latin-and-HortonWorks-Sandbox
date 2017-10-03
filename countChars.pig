A = load '/root/in/*' as (inputtext:chararray);
B = foreach A generate flatten(TOKENIZE(UPPER(inputtext))) as flattoken;
C = foreach B generate flatten(TOKENIZE(REPLACE(flattoken,'','|'),'|')) as individualletter;
D = filter C by individualletter matches '(.*[a-zA-Z].*)';
E = group D by individualletter;
F = foreach E generate COUNT(D),group;
store F into 'CHARCOUNTOP.txt';
