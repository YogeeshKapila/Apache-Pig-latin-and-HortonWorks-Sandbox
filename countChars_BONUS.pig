A = load '/root/in/*' as (inputtext:chararray);
B = foreach A generate flatten(TOKENIZE(UPPER(inputtext))) as flattoken;
C = foreach B generate flatten(TOKENIZE(REPLACE(flattoken,'','|'),'|')) as individualletter;
D = filter C by (individualletter=='A') OR (individualletter=='E') OR (individualletter=='I') OR (individualletter=='O') OR (individualletter=='U');
E = group D by individualletter;
F = foreach E generate COUNT(D),group;
store F into 'BONUSOUTPUT.TXT';
