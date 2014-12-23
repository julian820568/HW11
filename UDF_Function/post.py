import sys
@outputSchema("name:chararray")
def test2(str):
	name = str.replace("_"," ")
	return ''.join(name).encode('utf-8')
