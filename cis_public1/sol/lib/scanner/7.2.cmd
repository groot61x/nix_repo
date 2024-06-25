a=$(grep "^PASSLENGTH=" /etc/default/passwd)
#PASSLENGTH=14

b=$(grep "^NAMECHECK=" /etc/default/passwd)
#NAMECHECK=YES

c=$(grep "^HISTORY=" /etc/default/passwd)
#HISTORY=12

d=$(grep "^MINDIFF=" /etc/default/passwd)
#MINDIFF=3

e=$(grep "^MINUPPER=" /etc/default/passwd)
#MINUPPER=1

f=$(grep "^MINLOWER=1" /etc/default/passwd)
#MINLOWER=1

g=$(grep "^MINSPECIAL=1" /etc/default/passwd)
#MINSPECIAL=1

h=$(grep "^MINDIGIT=1" /etc/default/passwd)
#MINDIGIT=1

i=$(grep "^MAXREPEATS=1" /etc/default/passwd)
#MAXREPEATS=1

j=$(grep "^WHITESPACE=YES" /etc/default/passwd)
#WHITESPACE=YES

k=$(grep "^DICTIONDBDIR=/var/passwd" /etc/default/passwd)
#DICTIONDBDIR=/var/passwd

l=$(grep "^DICTIONLIST=/usr/share/lib/dict/words" /etc/default/passwd)
#DICTIONLIST=/usr/share/lib/dict/words

echo $a $b $c $d $e $f $g $h $i $j $k $l 