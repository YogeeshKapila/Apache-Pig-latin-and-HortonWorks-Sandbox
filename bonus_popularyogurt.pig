k = LOAD 'kids.txt' USING PigStorage(' ') as (nm:chararray, age:int);

p = LOAD 'purchases.txt' USING PigStorage(' ') as (km:chararray,yg:chararray);
kc = JOIN k by nm, p by km;

tc = FILTER kc BY age==10 OR age==11 OR age==12;

tcc = GROUP tc by yg;
yc = FOREACH tcc GENERATE group as yg,COUNT(tc) As count;

ycs = order yc by count desc;

res = LIMIT ycs 1;

STORE res into 'mostpopular.txt';


