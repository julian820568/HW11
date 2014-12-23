import sys
@outputSchema("name:chararray")
def test(str):
	fir = str.find(',')
	sec = str.find(']')
	str_2 = str[fir+3:sec]
	str_3 = str_2.replace(" \"","\"")
	str_4 = str_3.replace(" ","_")
	name = str_4.replace(","," ")
	return ''.join(name).encode('utf-8')
