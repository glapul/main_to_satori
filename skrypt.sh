H=`pwd`
unzip $1 -d $2
cd $2
ins=`ls *.in`
outs=`ls *.out`
declare -i numtests=`ls *.in | wc -l`
declare -i n=0
for i in *.in
	do
		mv $i $n.in
		mv ${i/in/out} $n.out
		n=n+1
	done
cp $H/examples.yaml ./
n=n-1
echo "0-$n:" > tests-multi.yaml
tail -4 $H/tests-multi.yaml >> tests-multi.yaml
zip io.zip *.in *.out


