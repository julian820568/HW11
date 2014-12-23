
REGISTER 'show.py' USING jython AS show;
reviews = LOAD 'dblp.json' AS (str:CHARARRAY);
temp = FOREACH reviews GENERATE show.test(str);
DUMP temp

B = foreach temp generate flatten(TOKENIZE((chararray)$0)) as word;
DUMP B

REGISTER 'post.py' USING jython AS post;
T = FOREACH B GENERATE post.test2(word) as word2;
DUMP T

C = group T by word2;
D = foreach C generate group, COUNT(T) as cnt; 
DUMP D

rank = RANK D BY cnt DESC DENSE;
DESCRIBE rank   

top = FILTER rank BY rank_D<=100;
final = FOREACH top GENERATE group, cnt;
DUMP final;

STORE final INTO 'output'; 