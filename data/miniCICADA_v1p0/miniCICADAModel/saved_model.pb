хё
ѕВ
D
AddV2
x"T
y"T
z"T"
Ttype:
2	ђљ
B
AssignVariableOp
resource
value"dtype"
dtypetypeѕ
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(ѕ
?
Mul
x"T
y"T
z"T"
Ttype:
2	љ
0
Neg
x"T
y"T"
Ttype:
2
	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetypeѕ
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0ѕ
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0ѕ
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
@
Softplus
features"T
activations"T"
Ttype:
2
Й
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ѕ
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
ќ
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ѕ"serve*2.6.42unknown8│╩
І
batch_normalization/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:├**
shared_namebatch_normalization/gamma
ё
-batch_normalization/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization/gamma*
_output_shapes	
:├*
dtype0
Ѕ
batch_normalization/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:├*)
shared_namebatch_normalization/beta
ѓ
,batch_normalization/beta/Read/ReadVariableOpReadVariableOpbatch_normalization/beta*
_output_shapes	
:├*
dtype0
Ќ
batch_normalization/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:├*0
shared_name!batch_normalization/moving_mean
љ
3batch_normalization/moving_mean/Read/ReadVariableOpReadVariableOpbatch_normalization/moving_mean*
_output_shapes	
:├*
dtype0
Ъ
#batch_normalization/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:├*4
shared_name%#batch_normalization/moving_variance
ў
7batch_normalization/moving_variance/Read/ReadVariableOpReadVariableOp#batch_normalization/moving_variance*
_output_shapes	
:├*
dtype0
v
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
├ђ*
shared_namedense/kernel
o
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel* 
_output_shapes
:
├ђ*
dtype0
m

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*
shared_name
dense/bias
f
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes	
:ђ*
dtype0
s
p_re_lu/alphaVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*
shared_namep_re_lu/alpha
l
!p_re_lu/alpha/Read/ReadVariableOpReadVariableOpp_re_lu/alpha*
_output_shapes	
:ђ*
dtype0
Ј
batch_normalization_1/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*,
shared_namebatch_normalization_1/gamma
ѕ
/batch_normalization_1/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_1/gamma*
_output_shapes	
:ђ*
dtype0
Ї
batch_normalization_1/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*+
shared_namebatch_normalization_1/beta
є
.batch_normalization_1/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_1/beta*
_output_shapes	
:ђ*
dtype0
Џ
!batch_normalization_1/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*2
shared_name#!batch_normalization_1/moving_mean
ћ
5batch_normalization_1/moving_mean/Read/ReadVariableOpReadVariableOp!batch_normalization_1/moving_mean*
_output_shapes	
:ђ*
dtype0
Б
%batch_normalization_1/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*6
shared_name'%batch_normalization_1/moving_variance
ю
9batch_normalization_1/moving_variance/Read/ReadVariableOpReadVariableOp%batch_normalization_1/moving_variance*
_output_shapes	
:ђ*
dtype0
z
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
ђђ*
shared_namedense_1/kernel
s
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel* 
_output_shapes
:
ђђ*
dtype0
q
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*
shared_namedense_1/bias
j
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:ђ*
dtype0
w
p_re_lu_1/alphaVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ* 
shared_namep_re_lu_1/alpha
p
#p_re_lu_1/alpha/Read/ReadVariableOpReadVariableOpp_re_lu_1/alpha*
_output_shapes	
:ђ*
dtype0
Ј
batch_normalization_2/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*,
shared_namebatch_normalization_2/gamma
ѕ
/batch_normalization_2/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_2/gamma*
_output_shapes	
:ђ*
dtype0
Ї
batch_normalization_2/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*+
shared_namebatch_normalization_2/beta
є
.batch_normalization_2/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_2/beta*
_output_shapes	
:ђ*
dtype0
Џ
!batch_normalization_2/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*2
shared_name#!batch_normalization_2/moving_mean
ћ
5batch_normalization_2/moving_mean/Read/ReadVariableOpReadVariableOp!batch_normalization_2/moving_mean*
_output_shapes	
:ђ*
dtype0
Б
%batch_normalization_2/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*6
shared_name'%batch_normalization_2/moving_variance
ю
9batch_normalization_2/moving_variance/Read/ReadVariableOpReadVariableOp%batch_normalization_2/moving_variance*
_output_shapes	
:ђ*
dtype0
y
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ђ@*
shared_namedense_2/kernel
r
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel*
_output_shapes
:	ђ@*
dtype0
p
dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_2/bias
i
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes
:@*
dtype0
v
p_re_lu_2/alphaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@* 
shared_namep_re_lu_2/alpha
o
#p_re_lu_2/alpha/Read/ReadVariableOpReadVariableOpp_re_lu_2/alpha*
_output_shapes
:@*
dtype0
ј
batch_normalization_3/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*,
shared_namebatch_normalization_3/gamma
Є
/batch_normalization_3/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization_3/gamma*
_output_shapes
:@*
dtype0
ї
batch_normalization_3/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*+
shared_namebatch_normalization_3/beta
Ё
.batch_normalization_3/beta/Read/ReadVariableOpReadVariableOpbatch_normalization_3/beta*
_output_shapes
:@*
dtype0
џ
!batch_normalization_3/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*2
shared_name#!batch_normalization_3/moving_mean
Њ
5batch_normalization_3/moving_mean/Read/ReadVariableOpReadVariableOp!batch_normalization_3/moving_mean*
_output_shapes
:@*
dtype0
б
%batch_normalization_3/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*6
shared_name'%batch_normalization_3/moving_variance
Џ
9batch_normalization_3/moving_variance/Read/ReadVariableOpReadVariableOp%batch_normalization_3/moving_variance*
_output_shapes
:@*
dtype0
x
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*
shared_namedense_3/kernel
q
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes

:@*
dtype0
p
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_3/bias
i
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:*
dtype0
h

Nadam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name
Nadam/iter
a
Nadam/iter/Read/ReadVariableOpReadVariableOp
Nadam/iter*
_output_shapes
: *
dtype0	
l
Nadam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameNadam/beta_1
e
 Nadam/beta_1/Read/ReadVariableOpReadVariableOpNadam/beta_1*
_output_shapes
: *
dtype0
l
Nadam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameNadam/beta_2
e
 Nadam/beta_2/Read/ReadVariableOpReadVariableOpNadam/beta_2*
_output_shapes
: *
dtype0
j
Nadam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameNadam/decay
c
Nadam/decay/Read/ReadVariableOpReadVariableOpNadam/decay*
_output_shapes
: *
dtype0
z
Nadam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *$
shared_nameNadam/learning_rate
s
'Nadam/learning_rate/Read/ReadVariableOpReadVariableOpNadam/learning_rate*
_output_shapes
: *
dtype0
|
Nadam/momentum_cacheVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameNadam/momentum_cache
u
(Nadam/momentum_cache/Read/ReadVariableOpReadVariableOpNadam/momentum_cache*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
b
total_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_2
[
total_2/Read/ReadVariableOpReadVariableOptotal_2*
_output_shapes
: *
dtype0
b
count_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_2
[
count_2/Read/ReadVariableOpReadVariableOpcount_2*
_output_shapes
: *
dtype0
Џ
!Nadam/batch_normalization/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:├*2
shared_name#!Nadam/batch_normalization/gamma/m
ћ
5Nadam/batch_normalization/gamma/m/Read/ReadVariableOpReadVariableOp!Nadam/batch_normalization/gamma/m*
_output_shapes	
:├*
dtype0
Ў
 Nadam/batch_normalization/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:├*1
shared_name" Nadam/batch_normalization/beta/m
њ
4Nadam/batch_normalization/beta/m/Read/ReadVariableOpReadVariableOp Nadam/batch_normalization/beta/m*
_output_shapes	
:├*
dtype0
є
Nadam/dense/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
├ђ*%
shared_nameNadam/dense/kernel/m

(Nadam/dense/kernel/m/Read/ReadVariableOpReadVariableOpNadam/dense/kernel/m* 
_output_shapes
:
├ђ*
dtype0
}
Nadam/dense/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*#
shared_nameNadam/dense/bias/m
v
&Nadam/dense/bias/m/Read/ReadVariableOpReadVariableOpNadam/dense/bias/m*
_output_shapes	
:ђ*
dtype0
Ѓ
Nadam/p_re_lu/alpha/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*&
shared_nameNadam/p_re_lu/alpha/m
|
)Nadam/p_re_lu/alpha/m/Read/ReadVariableOpReadVariableOpNadam/p_re_lu/alpha/m*
_output_shapes	
:ђ*
dtype0
Ъ
#Nadam/batch_normalization_1/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*4
shared_name%#Nadam/batch_normalization_1/gamma/m
ў
7Nadam/batch_normalization_1/gamma/m/Read/ReadVariableOpReadVariableOp#Nadam/batch_normalization_1/gamma/m*
_output_shapes	
:ђ*
dtype0
Ю
"Nadam/batch_normalization_1/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*3
shared_name$"Nadam/batch_normalization_1/beta/m
ќ
6Nadam/batch_normalization_1/beta/m/Read/ReadVariableOpReadVariableOp"Nadam/batch_normalization_1/beta/m*
_output_shapes	
:ђ*
dtype0
і
Nadam/dense_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
ђђ*'
shared_nameNadam/dense_1/kernel/m
Ѓ
*Nadam/dense_1/kernel/m/Read/ReadVariableOpReadVariableOpNadam/dense_1/kernel/m* 
_output_shapes
:
ђђ*
dtype0
Ђ
Nadam/dense_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*%
shared_nameNadam/dense_1/bias/m
z
(Nadam/dense_1/bias/m/Read/ReadVariableOpReadVariableOpNadam/dense_1/bias/m*
_output_shapes	
:ђ*
dtype0
Є
Nadam/p_re_lu_1/alpha/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*(
shared_nameNadam/p_re_lu_1/alpha/m
ђ
+Nadam/p_re_lu_1/alpha/m/Read/ReadVariableOpReadVariableOpNadam/p_re_lu_1/alpha/m*
_output_shapes	
:ђ*
dtype0
Ъ
#Nadam/batch_normalization_2/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*4
shared_name%#Nadam/batch_normalization_2/gamma/m
ў
7Nadam/batch_normalization_2/gamma/m/Read/ReadVariableOpReadVariableOp#Nadam/batch_normalization_2/gamma/m*
_output_shapes	
:ђ*
dtype0
Ю
"Nadam/batch_normalization_2/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*3
shared_name$"Nadam/batch_normalization_2/beta/m
ќ
6Nadam/batch_normalization_2/beta/m/Read/ReadVariableOpReadVariableOp"Nadam/batch_normalization_2/beta/m*
_output_shapes	
:ђ*
dtype0
Ѕ
Nadam/dense_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ђ@*'
shared_nameNadam/dense_2/kernel/m
ѓ
*Nadam/dense_2/kernel/m/Read/ReadVariableOpReadVariableOpNadam/dense_2/kernel/m*
_output_shapes
:	ђ@*
dtype0
ђ
Nadam/dense_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*%
shared_nameNadam/dense_2/bias/m
y
(Nadam/dense_2/bias/m/Read/ReadVariableOpReadVariableOpNadam/dense_2/bias/m*
_output_shapes
:@*
dtype0
є
Nadam/p_re_lu_2/alpha/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*(
shared_nameNadam/p_re_lu_2/alpha/m

+Nadam/p_re_lu_2/alpha/m/Read/ReadVariableOpReadVariableOpNadam/p_re_lu_2/alpha/m*
_output_shapes
:@*
dtype0
ъ
#Nadam/batch_normalization_3/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#Nadam/batch_normalization_3/gamma/m
Ќ
7Nadam/batch_normalization_3/gamma/m/Read/ReadVariableOpReadVariableOp#Nadam/batch_normalization_3/gamma/m*
_output_shapes
:@*
dtype0
ю
"Nadam/batch_normalization_3/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*3
shared_name$"Nadam/batch_normalization_3/beta/m
Ћ
6Nadam/batch_normalization_3/beta/m/Read/ReadVariableOpReadVariableOp"Nadam/batch_normalization_3/beta/m*
_output_shapes
:@*
dtype0
ѕ
Nadam/dense_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*'
shared_nameNadam/dense_3/kernel/m
Ђ
*Nadam/dense_3/kernel/m/Read/ReadVariableOpReadVariableOpNadam/dense_3/kernel/m*
_output_shapes

:@*
dtype0
ђ
Nadam/dense_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameNadam/dense_3/bias/m
y
(Nadam/dense_3/bias/m/Read/ReadVariableOpReadVariableOpNadam/dense_3/bias/m*
_output_shapes
:*
dtype0
Џ
!Nadam/batch_normalization/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:├*2
shared_name#!Nadam/batch_normalization/gamma/v
ћ
5Nadam/batch_normalization/gamma/v/Read/ReadVariableOpReadVariableOp!Nadam/batch_normalization/gamma/v*
_output_shapes	
:├*
dtype0
Ў
 Nadam/batch_normalization/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:├*1
shared_name" Nadam/batch_normalization/beta/v
њ
4Nadam/batch_normalization/beta/v/Read/ReadVariableOpReadVariableOp Nadam/batch_normalization/beta/v*
_output_shapes	
:├*
dtype0
є
Nadam/dense/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
├ђ*%
shared_nameNadam/dense/kernel/v

(Nadam/dense/kernel/v/Read/ReadVariableOpReadVariableOpNadam/dense/kernel/v* 
_output_shapes
:
├ђ*
dtype0
}
Nadam/dense/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*#
shared_nameNadam/dense/bias/v
v
&Nadam/dense/bias/v/Read/ReadVariableOpReadVariableOpNadam/dense/bias/v*
_output_shapes	
:ђ*
dtype0
Ѓ
Nadam/p_re_lu/alpha/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*&
shared_nameNadam/p_re_lu/alpha/v
|
)Nadam/p_re_lu/alpha/v/Read/ReadVariableOpReadVariableOpNadam/p_re_lu/alpha/v*
_output_shapes	
:ђ*
dtype0
Ъ
#Nadam/batch_normalization_1/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*4
shared_name%#Nadam/batch_normalization_1/gamma/v
ў
7Nadam/batch_normalization_1/gamma/v/Read/ReadVariableOpReadVariableOp#Nadam/batch_normalization_1/gamma/v*
_output_shapes	
:ђ*
dtype0
Ю
"Nadam/batch_normalization_1/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*3
shared_name$"Nadam/batch_normalization_1/beta/v
ќ
6Nadam/batch_normalization_1/beta/v/Read/ReadVariableOpReadVariableOp"Nadam/batch_normalization_1/beta/v*
_output_shapes	
:ђ*
dtype0
і
Nadam/dense_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
ђђ*'
shared_nameNadam/dense_1/kernel/v
Ѓ
*Nadam/dense_1/kernel/v/Read/ReadVariableOpReadVariableOpNadam/dense_1/kernel/v* 
_output_shapes
:
ђђ*
dtype0
Ђ
Nadam/dense_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*%
shared_nameNadam/dense_1/bias/v
z
(Nadam/dense_1/bias/v/Read/ReadVariableOpReadVariableOpNadam/dense_1/bias/v*
_output_shapes	
:ђ*
dtype0
Є
Nadam/p_re_lu_1/alpha/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*(
shared_nameNadam/p_re_lu_1/alpha/v
ђ
+Nadam/p_re_lu_1/alpha/v/Read/ReadVariableOpReadVariableOpNadam/p_re_lu_1/alpha/v*
_output_shapes	
:ђ*
dtype0
Ъ
#Nadam/batch_normalization_2/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*4
shared_name%#Nadam/batch_normalization_2/gamma/v
ў
7Nadam/batch_normalization_2/gamma/v/Read/ReadVariableOpReadVariableOp#Nadam/batch_normalization_2/gamma/v*
_output_shapes	
:ђ*
dtype0
Ю
"Nadam/batch_normalization_2/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:ђ*3
shared_name$"Nadam/batch_normalization_2/beta/v
ќ
6Nadam/batch_normalization_2/beta/v/Read/ReadVariableOpReadVariableOp"Nadam/batch_normalization_2/beta/v*
_output_shapes	
:ђ*
dtype0
Ѕ
Nadam/dense_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	ђ@*'
shared_nameNadam/dense_2/kernel/v
ѓ
*Nadam/dense_2/kernel/v/Read/ReadVariableOpReadVariableOpNadam/dense_2/kernel/v*
_output_shapes
:	ђ@*
dtype0
ђ
Nadam/dense_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*%
shared_nameNadam/dense_2/bias/v
y
(Nadam/dense_2/bias/v/Read/ReadVariableOpReadVariableOpNadam/dense_2/bias/v*
_output_shapes
:@*
dtype0
є
Nadam/p_re_lu_2/alpha/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*(
shared_nameNadam/p_re_lu_2/alpha/v

+Nadam/p_re_lu_2/alpha/v/Read/ReadVariableOpReadVariableOpNadam/p_re_lu_2/alpha/v*
_output_shapes
:@*
dtype0
ъ
#Nadam/batch_normalization_3/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*4
shared_name%#Nadam/batch_normalization_3/gamma/v
Ќ
7Nadam/batch_normalization_3/gamma/v/Read/ReadVariableOpReadVariableOp#Nadam/batch_normalization_3/gamma/v*
_output_shapes
:@*
dtype0
ю
"Nadam/batch_normalization_3/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*3
shared_name$"Nadam/batch_normalization_3/beta/v
Ћ
6Nadam/batch_normalization_3/beta/v/Read/ReadVariableOpReadVariableOp"Nadam/batch_normalization_3/beta/v*
_output_shapes
:@*
dtype0
ѕ
Nadam/dense_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*'
shared_nameNadam/dense_3/kernel/v
Ђ
*Nadam/dense_3/kernel/v/Read/ReadVariableOpReadVariableOpNadam/dense_3/kernel/v*
_output_shapes

:@*
dtype0
ђ
Nadam/dense_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameNadam/dense_3/bias/v
y
(Nadam/dense_3/bias/v/Read/ReadVariableOpReadVariableOpNadam/dense_3/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
У|
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*Б|
valueЎ|Bќ| BЈ|
п
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
layer_with_weights-3
layer-4
layer-5
layer_with_weights-4
layer-6
layer_with_weights-5
layer-7
	layer_with_weights-6
	layer-8

layer-9
layer_with_weights-7
layer-10
layer_with_weights-8
layer-11
layer_with_weights-9
layer-12
layer-13
layer_with_weights-10
layer-14
	optimizer
trainable_variables
regularization_losses
	variables
	keras_api

signatures
Ќ
axis
	gamma
beta
moving_mean
moving_variance
trainable_variables
regularization_losses
	variables
	keras_api
R
trainable_variables
 regularization_losses
!	variables
"	keras_api
h

#kernel
$bias
%trainable_variables
&regularization_losses
'	variables
(	keras_api
]
	)alpha
*trainable_variables
+regularization_losses
,	variables
-	keras_api
Ќ
.axis
	/gamma
0beta
1moving_mean
2moving_variance
3trainable_variables
4regularization_losses
5	variables
6	keras_api
R
7trainable_variables
8regularization_losses
9	variables
:	keras_api
h

;kernel
<bias
=trainable_variables
>regularization_losses
?	variables
@	keras_api
]
	Aalpha
Btrainable_variables
Cregularization_losses
D	variables
E	keras_api
Ќ
Faxis
	Ggamma
Hbeta
Imoving_mean
Jmoving_variance
Ktrainable_variables
Lregularization_losses
M	variables
N	keras_api
R
Otrainable_variables
Pregularization_losses
Q	variables
R	keras_api
h

Skernel
Tbias
Utrainable_variables
Vregularization_losses
W	variables
X	keras_api
]
	Yalpha
Ztrainable_variables
[regularization_losses
\	variables
]	keras_api
Ќ
^axis
	_gamma
`beta
amoving_mean
bmoving_variance
ctrainable_variables
dregularization_losses
e	variables
f	keras_api
R
gtrainable_variables
hregularization_losses
i	variables
j	keras_api
h

kkernel
lbias
mtrainable_variables
nregularization_losses
o	variables
p	keras_api
л
qiter

rbeta_1

sbeta_2
	tdecay
ulearning_rate
vmomentum_cachemОmп#m┘$m┌)m█/m▄0mП;mя<m▀AmЯGmрHmРSmсTmСYmт_mТ`mуkmУlmжvЖvв#vВ$vь)vЬ/v№0v­;vы<vЫAvзGvЗHvшSvШTvэYvЭ_vщ`vЩkvчlvЧ
ј
0
1
#2
$3
)4
/5
06
;7
<8
A9
G10
H11
S12
T13
Y14
_15
`16
k17
l18
 
╬
0
1
2
3
#4
$5
)6
/7
08
19
210
;11
<12
A13
G14
H15
I16
J17
S18
T19
Y20
_21
`22
a23
b24
k25
l26
Г

wlayers
trainable_variables
xnon_trainable_variables
regularization_losses
	variables
ylayer_regularization_losses
zmetrics
{layer_metrics
 
 
db
VARIABLE_VALUEbatch_normalization/gamma5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUE
b`
VARIABLE_VALUEbatch_normalization/beta4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUE
pn
VARIABLE_VALUEbatch_normalization/moving_mean;layer_with_weights-0/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUE#batch_normalization/moving_variance?layer_with_weights-0/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

0
1
 

0
1
2
3
«

|layers
trainable_variables
}non_trainable_variables
regularization_losses
	variables
~layer_regularization_losses
metrics
ђlayer_metrics
 
 
 
▓
Ђlayers
trainable_variables
ѓnon_trainable_variables
 regularization_losses
!	variables
 Ѓlayer_regularization_losses
ёmetrics
Ёlayer_metrics
XV
VARIABLE_VALUEdense/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
TR
VARIABLE_VALUE
dense/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE

#0
$1
 

#0
$1
▓
єlayers
%trainable_variables
Єnon_trainable_variables
&regularization_losses
'	variables
 ѕlayer_regularization_losses
Ѕmetrics
іlayer_metrics
XV
VARIABLE_VALUEp_re_lu/alpha5layer_with_weights-2/alpha/.ATTRIBUTES/VARIABLE_VALUE

)0
 

)0
▓
Іlayers
*trainable_variables
їnon_trainable_variables
+regularization_losses
,	variables
 Їlayer_regularization_losses
јmetrics
Јlayer_metrics
 
fd
VARIABLE_VALUEbatch_normalization_1/gamma5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEbatch_normalization_1/beta4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUE!batch_normalization_1/moving_mean;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE%batch_normalization_1/moving_variance?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

/0
01
 

/0
01
12
23
▓
љlayers
3trainable_variables
Љnon_trainable_variables
4regularization_losses
5	variables
 њlayer_regularization_losses
Њmetrics
ћlayer_metrics
 
 
 
▓
Ћlayers
7trainable_variables
ќnon_trainable_variables
8regularization_losses
9	variables
 Ќlayer_regularization_losses
ўmetrics
Ўlayer_metrics
ZX
VARIABLE_VALUEdense_1/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEdense_1/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE

;0
<1
 

;0
<1
▓
џlayers
=trainable_variables
Џnon_trainable_variables
>regularization_losses
?	variables
 юlayer_regularization_losses
Юmetrics
ъlayer_metrics
ZX
VARIABLE_VALUEp_re_lu_1/alpha5layer_with_weights-5/alpha/.ATTRIBUTES/VARIABLE_VALUE

A0
 

A0
▓
Ъlayers
Btrainable_variables
аnon_trainable_variables
Cregularization_losses
D	variables
 Аlayer_regularization_losses
бmetrics
Бlayer_metrics
 
fd
VARIABLE_VALUEbatch_normalization_2/gamma5layer_with_weights-6/gamma/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEbatch_normalization_2/beta4layer_with_weights-6/beta/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUE!batch_normalization_2/moving_mean;layer_with_weights-6/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE%batch_normalization_2/moving_variance?layer_with_weights-6/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

G0
H1
 

G0
H1
I2
J3
▓
цlayers
Ktrainable_variables
Цnon_trainable_variables
Lregularization_losses
M	variables
 дlayer_regularization_losses
Дmetrics
еlayer_metrics
 
 
 
▓
Еlayers
Otrainable_variables
фnon_trainable_variables
Pregularization_losses
Q	variables
 Фlayer_regularization_losses
гmetrics
Гlayer_metrics
ZX
VARIABLE_VALUEdense_2/kernel6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEdense_2/bias4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUE

S0
T1
 

S0
T1
▓
«layers
Utrainable_variables
»non_trainable_variables
Vregularization_losses
W	variables
 ░layer_regularization_losses
▒metrics
▓layer_metrics
ZX
VARIABLE_VALUEp_re_lu_2/alpha5layer_with_weights-8/alpha/.ATTRIBUTES/VARIABLE_VALUE

Y0
 

Y0
▓
│layers
Ztrainable_variables
┤non_trainable_variables
[regularization_losses
\	variables
 хlayer_regularization_losses
Хmetrics
иlayer_metrics
 
fd
VARIABLE_VALUEbatch_normalization_3/gamma5layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUE
db
VARIABLE_VALUEbatch_normalization_3/beta4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUE
rp
VARIABLE_VALUE!batch_normalization_3/moving_mean;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUE%batch_normalization_3/moving_variance?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

_0
`1
 

_0
`1
a2
b3
▓
Иlayers
ctrainable_variables
╣non_trainable_variables
dregularization_losses
e	variables
 ║layer_regularization_losses
╗metrics
╝layer_metrics
 
 
 
▓
йlayers
gtrainable_variables
Йnon_trainable_variables
hregularization_losses
i	variables
 ┐layer_regularization_losses
└metrics
┴layer_metrics
[Y
VARIABLE_VALUEdense_3/kernel7layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEdense_3/bias5layer_with_weights-10/bias/.ATTRIBUTES/VARIABLE_VALUE

k0
l1
 

k0
l1
▓
┬layers
mtrainable_variables
├non_trainable_variables
nregularization_losses
o	variables
 ─layer_regularization_losses
┼metrics
кlayer_metrics
IG
VARIABLE_VALUE
Nadam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
MK
VARIABLE_VALUENadam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
MK
VARIABLE_VALUENadam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
KI
VARIABLE_VALUENadam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUENadam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
][
VARIABLE_VALUENadam/momentum_cache3optimizer/momentum_cache/.ATTRIBUTES/VARIABLE_VALUE
n
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
8
0
1
12
23
I4
J5
a6
b7
 

К0
╚1
╔2
 
 

0
1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

10
21
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

I0
J1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

a0
b1
 
 
 
 
 
 
 
 
 
 
 
 
 
8

╩total

╦count
╠	variables
═	keras_api
8

╬total

¤count
л	variables
Л	keras_api
I

мtotal

Мcount
н
_fn_kwargs
Н	variables
о	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

╩0
╦1

╠	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE

╬0
¤1

л	variables
QO
VARIABLE_VALUEtotal_24keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_24keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUE
 

м0
М1

Н	variables
Ѕє
VARIABLE_VALUE!Nadam/batch_normalization/gamma/mQlayer_with_weights-0/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Єё
VARIABLE_VALUE Nadam/batch_normalization/beta/mPlayer_with_weights-0/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUENadam/dense/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUENadam/dense/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUENadam/p_re_lu/alpha/mQlayer_with_weights-2/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Іѕ
VARIABLE_VALUE#Nadam/batch_normalization_1/gamma/mQlayer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Ѕє
VARIABLE_VALUE"Nadam/batch_normalization_1/beta/mPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUENadam/dense_1/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUENadam/dense_1/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUENadam/p_re_lu_1/alpha/mQlayer_with_weights-5/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Іѕ
VARIABLE_VALUE#Nadam/batch_normalization_2/gamma/mQlayer_with_weights-6/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Ѕє
VARIABLE_VALUE"Nadam/batch_normalization_2/beta/mPlayer_with_weights-6/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUENadam/dense_2/kernel/mRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUENadam/dense_2/bias/mPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUENadam/p_re_lu_2/alpha/mQlayer_with_weights-8/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Іѕ
VARIABLE_VALUE#Nadam/batch_normalization_3/gamma/mQlayer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Ѕє
VARIABLE_VALUE"Nadam/batch_normalization_3/beta/mPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUENadam/dense_3/kernel/mSlayer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUENadam/dense_3/bias/mQlayer_with_weights-10/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
Ѕє
VARIABLE_VALUE!Nadam/batch_normalization/gamma/vQlayer_with_weights-0/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Єё
VARIABLE_VALUE Nadam/batch_normalization/beta/vPlayer_with_weights-0/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUENadam/dense/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUENadam/dense/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUENadam/p_re_lu/alpha/vQlayer_with_weights-2/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Іѕ
VARIABLE_VALUE#Nadam/batch_normalization_1/gamma/vQlayer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Ѕє
VARIABLE_VALUE"Nadam/batch_normalization_1/beta/vPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUENadam/dense_1/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUENadam/dense_1/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUENadam/p_re_lu_1/alpha/vQlayer_with_weights-5/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Іѕ
VARIABLE_VALUE#Nadam/batch_normalization_2/gamma/vQlayer_with_weights-6/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Ѕє
VARIABLE_VALUE"Nadam/batch_normalization_2/beta/vPlayer_with_weights-6/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUENadam/dense_2/kernel/vRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUENadam/dense_2/bias/vPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUENadam/p_re_lu_2/alpha/vQlayer_with_weights-8/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Іѕ
VARIABLE_VALUE#Nadam/batch_normalization_3/gamma/vQlayer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
Ѕє
VARIABLE_VALUE"Nadam/batch_normalization_3/beta/vPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}
VARIABLE_VALUENadam/dense_3/kernel/vSlayer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
{y
VARIABLE_VALUENadam/dense_3/bias/vQlayer_with_weights-10/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|
serving_default_input_1Placeholder*(
_output_shapes
:         ├*
dtype0*
shape:         ├
Ћ
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1#batch_normalization/moving_variancebatch_normalization/gammabatch_normalization/moving_meanbatch_normalization/betadense/kernel
dense/biasp_re_lu/alpha%batch_normalization_1/moving_variancebatch_normalization_1/gamma!batch_normalization_1/moving_meanbatch_normalization_1/betadense_1/kerneldense_1/biasp_re_lu_1/alpha%batch_normalization_2/moving_variancebatch_normalization_2/gamma!batch_normalization_2/moving_meanbatch_normalization_2/betadense_2/kerneldense_2/biasp_re_lu_2/alpha%batch_normalization_3/moving_variancebatch_normalization_3/gamma!batch_normalization_3/moving_meanbatch_normalization_3/betadense_3/kerneldense_3/bias*'
Tin 
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *=
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *,
f'R%
#__inference_signature_wrapper_11083
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
т
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename-batch_normalization/gamma/Read/ReadVariableOp,batch_normalization/beta/Read/ReadVariableOp3batch_normalization/moving_mean/Read/ReadVariableOp7batch_normalization/moving_variance/Read/ReadVariableOp dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp!p_re_lu/alpha/Read/ReadVariableOp/batch_normalization_1/gamma/Read/ReadVariableOp.batch_normalization_1/beta/Read/ReadVariableOp5batch_normalization_1/moving_mean/Read/ReadVariableOp9batch_normalization_1/moving_variance/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp#p_re_lu_1/alpha/Read/ReadVariableOp/batch_normalization_2/gamma/Read/ReadVariableOp.batch_normalization_2/beta/Read/ReadVariableOp5batch_normalization_2/moving_mean/Read/ReadVariableOp9batch_normalization_2/moving_variance/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOp#p_re_lu_2/alpha/Read/ReadVariableOp/batch_normalization_3/gamma/Read/ReadVariableOp.batch_normalization_3/beta/Read/ReadVariableOp5batch_normalization_3/moving_mean/Read/ReadVariableOp9batch_normalization_3/moving_variance/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOpNadam/iter/Read/ReadVariableOp Nadam/beta_1/Read/ReadVariableOp Nadam/beta_2/Read/ReadVariableOpNadam/decay/Read/ReadVariableOp'Nadam/learning_rate/Read/ReadVariableOp(Nadam/momentum_cache/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal_2/Read/ReadVariableOpcount_2/Read/ReadVariableOp5Nadam/batch_normalization/gamma/m/Read/ReadVariableOp4Nadam/batch_normalization/beta/m/Read/ReadVariableOp(Nadam/dense/kernel/m/Read/ReadVariableOp&Nadam/dense/bias/m/Read/ReadVariableOp)Nadam/p_re_lu/alpha/m/Read/ReadVariableOp7Nadam/batch_normalization_1/gamma/m/Read/ReadVariableOp6Nadam/batch_normalization_1/beta/m/Read/ReadVariableOp*Nadam/dense_1/kernel/m/Read/ReadVariableOp(Nadam/dense_1/bias/m/Read/ReadVariableOp+Nadam/p_re_lu_1/alpha/m/Read/ReadVariableOp7Nadam/batch_normalization_2/gamma/m/Read/ReadVariableOp6Nadam/batch_normalization_2/beta/m/Read/ReadVariableOp*Nadam/dense_2/kernel/m/Read/ReadVariableOp(Nadam/dense_2/bias/m/Read/ReadVariableOp+Nadam/p_re_lu_2/alpha/m/Read/ReadVariableOp7Nadam/batch_normalization_3/gamma/m/Read/ReadVariableOp6Nadam/batch_normalization_3/beta/m/Read/ReadVariableOp*Nadam/dense_3/kernel/m/Read/ReadVariableOp(Nadam/dense_3/bias/m/Read/ReadVariableOp5Nadam/batch_normalization/gamma/v/Read/ReadVariableOp4Nadam/batch_normalization/beta/v/Read/ReadVariableOp(Nadam/dense/kernel/v/Read/ReadVariableOp&Nadam/dense/bias/v/Read/ReadVariableOp)Nadam/p_re_lu/alpha/v/Read/ReadVariableOp7Nadam/batch_normalization_1/gamma/v/Read/ReadVariableOp6Nadam/batch_normalization_1/beta/v/Read/ReadVariableOp*Nadam/dense_1/kernel/v/Read/ReadVariableOp(Nadam/dense_1/bias/v/Read/ReadVariableOp+Nadam/p_re_lu_1/alpha/v/Read/ReadVariableOp7Nadam/batch_normalization_2/gamma/v/Read/ReadVariableOp6Nadam/batch_normalization_2/beta/v/Read/ReadVariableOp*Nadam/dense_2/kernel/v/Read/ReadVariableOp(Nadam/dense_2/bias/v/Read/ReadVariableOp+Nadam/p_re_lu_2/alpha/v/Read/ReadVariableOp7Nadam/batch_normalization_3/gamma/v/Read/ReadVariableOp6Nadam/batch_normalization_3/beta/v/Read/ReadVariableOp*Nadam/dense_3/kernel/v/Read/ReadVariableOp(Nadam/dense_3/bias/v/Read/ReadVariableOpConst*Z
TinS
Q2O	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *'
f"R 
__inference__traced_save_12400
▄
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamebatch_normalization/gammabatch_normalization/betabatch_normalization/moving_mean#batch_normalization/moving_variancedense/kernel
dense/biasp_re_lu/alphabatch_normalization_1/gammabatch_normalization_1/beta!batch_normalization_1/moving_mean%batch_normalization_1/moving_variancedense_1/kerneldense_1/biasp_re_lu_1/alphabatch_normalization_2/gammabatch_normalization_2/beta!batch_normalization_2/moving_mean%batch_normalization_2/moving_variancedense_2/kerneldense_2/biasp_re_lu_2/alphabatch_normalization_3/gammabatch_normalization_3/beta!batch_normalization_3/moving_mean%batch_normalization_3/moving_variancedense_3/kerneldense_3/bias
Nadam/iterNadam/beta_1Nadam/beta_2Nadam/decayNadam/learning_rateNadam/momentum_cachetotalcounttotal_1count_1total_2count_2!Nadam/batch_normalization/gamma/m Nadam/batch_normalization/beta/mNadam/dense/kernel/mNadam/dense/bias/mNadam/p_re_lu/alpha/m#Nadam/batch_normalization_1/gamma/m"Nadam/batch_normalization_1/beta/mNadam/dense_1/kernel/mNadam/dense_1/bias/mNadam/p_re_lu_1/alpha/m#Nadam/batch_normalization_2/gamma/m"Nadam/batch_normalization_2/beta/mNadam/dense_2/kernel/mNadam/dense_2/bias/mNadam/p_re_lu_2/alpha/m#Nadam/batch_normalization_3/gamma/m"Nadam/batch_normalization_3/beta/mNadam/dense_3/kernel/mNadam/dense_3/bias/m!Nadam/batch_normalization/gamma/v Nadam/batch_normalization/beta/vNadam/dense/kernel/vNadam/dense/bias/vNadam/p_re_lu/alpha/v#Nadam/batch_normalization_1/gamma/v"Nadam/batch_normalization_1/beta/vNadam/dense_1/kernel/vNadam/dense_1/bias/vNadam/p_re_lu_1/alpha/v#Nadam/batch_normalization_2/gamma/v"Nadam/batch_normalization_2/beta/vNadam/dense_2/kernel/vNadam/dense_2/bias/vNadam/p_re_lu_2/alpha/v#Nadam/batch_normalization_3/gamma/v"Nadam/batch_normalization_3/beta/vNadam/dense_3/kernel/vNadam/dense_3/bias/v*Y
TinR
P2N*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ **
f%R#
!__inference__traced_restore_12641╩з
Т*
В
O__inference_batch_normalization_1_layer_call_and_return_conditional_losses_9746

inputs6
'assignmovingavg_readvariableop_resource:	ђ8
)assignmovingavg_1_readvariableop_resource:	ђ4
%batchnorm_mul_readvariableop_resource:	ђ0
!batchnorm_readvariableop_resource:	ђ
identityѕбAssignMovingAvgбAssignMovingAvg/ReadVariableOpбAssignMovingAvg_1б AssignMovingAvg_1/ReadVariableOpбbatchnorm/ReadVariableOpбbatchnorm/mul/ReadVariableOpі
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indicesљ
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2
moments/mean}
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	ђ2
moments/StopGradientЦ
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:         ђ2
moments/SquaredDifferenceњ
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices│
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2
moments/varianceЂ
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2
moments/SqueezeЅ
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2
moments/Squeeze_1s
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg/decayЦ
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:ђ*
dtype02 
AssignMovingAvg/ReadVariableOpЎ
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg/subљ
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg/mul┐
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvgw
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg_1/decayФ
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype02"
 AssignMovingAvg_1/ReadVariableOpА
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg_1/subў
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg_1/mul╔
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvg_1g
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЃ
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/mul_1|
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/mul_2Њ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOpѓ
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

IdentityЫ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
Т*
В
O__inference_batch_normalization_2_layer_call_and_return_conditional_losses_9948

inputs6
'assignmovingavg_readvariableop_resource:	ђ8
)assignmovingavg_1_readvariableop_resource:	ђ4
%batchnorm_mul_readvariableop_resource:	ђ0
!batchnorm_readvariableop_resource:	ђ
identityѕбAssignMovingAvgбAssignMovingAvg/ReadVariableOpбAssignMovingAvg_1б AssignMovingAvg_1/ReadVariableOpбbatchnorm/ReadVariableOpбbatchnorm/mul/ReadVariableOpі
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indicesљ
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2
moments/mean}
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	ђ2
moments/StopGradientЦ
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:         ђ2
moments/SquaredDifferenceњ
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices│
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2
moments/varianceЂ
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2
moments/SqueezeЅ
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2
moments/Squeeze_1s
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg/decayЦ
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:ђ*
dtype02 
AssignMovingAvg/ReadVariableOpЎ
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg/subљ
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg/mul┐
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvgw
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg_1/decayФ
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype02"
 AssignMovingAvg_1/ReadVariableOpА
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg_1/subў
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg_1/mul╔
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvg_1g
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЃ
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/mul_1|
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/mul_2Њ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOpѓ
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

IdentityЫ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
д
║
*__inference_sequential_layer_call_fn_10467
input_1
unknown:	├
	unknown_0:	├
	unknown_1:	├
	unknown_2:	├
	unknown_3:
├ђ
	unknown_4:	ђ
	unknown_5:	ђ
	unknown_6:	ђ
	unknown_7:	ђ
	unknown_8:	ђ
	unknown_9:	ђ

unknown_10:
ђђ

unknown_11:	ђ

unknown_12:	ђ

unknown_13:	ђ

unknown_14:	ђ

unknown_15:	ђ

unknown_16:	ђ

unknown_17:	ђ@

unknown_18:@

unknown_19:@

unknown_20:@

unknown_21:@

unknown_22:@

unknown_23:@

unknown_24:@

unknown_25:
identityѕбStatefulPartitionedCallл
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25*'
Tin 
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *=
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_104102
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:         ├
!
_user_specified_name	input_1
║U
г
E__inference_sequential_layer_call_and_return_conditional_losses_10754

inputs(
batch_normalization_10684:	├(
batch_normalization_10686:	├(
batch_normalization_10688:	├(
batch_normalization_10690:	├
dense_10694:
├ђ
dense_10696:	ђ
p_re_lu_10699:	ђ*
batch_normalization_1_10702:	ђ*
batch_normalization_1_10704:	ђ*
batch_normalization_1_10706:	ђ*
batch_normalization_1_10708:	ђ!
dense_1_10712:
ђђ
dense_1_10714:	ђ
p_re_lu_1_10717:	ђ*
batch_normalization_2_10720:	ђ*
batch_normalization_2_10722:	ђ*
batch_normalization_2_10724:	ђ*
batch_normalization_2_10726:	ђ 
dense_2_10730:	ђ@
dense_2_10732:@
p_re_lu_2_10735:@)
batch_normalization_3_10738:@)
batch_normalization_3_10740:@)
batch_normalization_3_10742:@)
batch_normalization_3_10744:@
dense_3_10748:@
dense_3_10750:
identityѕб+batch_normalization/StatefulPartitionedCallб-batch_normalization_1/StatefulPartitionedCallб-batch_normalization_2/StatefulPartitionedCallб-batch_normalization_3/StatefulPartitionedCallбdense/StatefulPartitionedCallбdense_1/StatefulPartitionedCallбdense_2/StatefulPartitionedCallбdense_3/StatefulPartitionedCallбdropout/StatefulPartitionedCallб!dropout_1/StatefulPartitionedCallб!dropout_2/StatefulPartitionedCallб!dropout_3/StatefulPartitionedCallбp_re_lu/StatefulPartitionedCallб!p_re_lu_1/StatefulPartitionedCallб!p_re_lu_2/StatefulPartitionedCallЁ
+batch_normalization/StatefulPartitionedCallStatefulPartitionedCallinputsbatch_normalization_10684batch_normalization_10686batch_normalization_10688batch_normalization_10690*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *V
fQRO
M__inference_batch_normalization_layer_call_and_return_conditional_losses_95442-
+batch_normalization/StatefulPartitionedCallю
dropout/StatefulPartitionedCallStatefulPartitionedCall4batch_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dropout_layer_call_and_return_conditional_losses_106172!
dropout/StatefulPartitionedCallф
dense/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0dense_10694dense_10696*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_102612
dense/StatefulPartitionedCallА
p_re_lu/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0p_re_lu_10699*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_p_re_lu_layer_call_and_return_conditional_losses_102782!
p_re_lu/StatefulPartitionedCallх
-batch_normalization_1/StatefulPartitionedCallStatefulPartitionedCall(p_re_lu/StatefulPartitionedCall:output:0batch_normalization_1_10702batch_normalization_1_10704batch_normalization_1_10706batch_normalization_1_10708*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_1_layer_call_and_return_conditional_losses_97462/
-batch_normalization_1/StatefulPartitionedCallк
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall6batch_normalization_1/StatefulPartitionedCall:output:0 ^dropout/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_1_layer_call_and_return_conditional_losses_105772#
!dropout_1/StatefulPartitionedCallХ
dense_1/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense_1_10712dense_1_10714*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_103082!
dense_1/StatefulPartitionedCallФ
!p_re_lu_1/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0p_re_lu_1_10717*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_103252#
!p_re_lu_1/StatefulPartitionedCallи
-batch_normalization_2/StatefulPartitionedCallStatefulPartitionedCall*p_re_lu_1/StatefulPartitionedCall:output:0batch_normalization_2_10720batch_normalization_2_10722batch_normalization_2_10724batch_normalization_2_10726*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_2_layer_call_and_return_conditional_losses_99482/
-batch_normalization_2/StatefulPartitionedCall╚
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall6batch_normalization_2/StatefulPartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_105372#
!dropout_2/StatefulPartitionedCallх
dense_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense_2_10730dense_2_10732*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_103552!
dense_2/StatefulPartitionedCallф
!p_re_lu_2/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0p_re_lu_2_10735*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_103722#
!p_re_lu_2/StatefulPartitionedCallи
-batch_normalization_3/StatefulPartitionedCallStatefulPartitionedCall*p_re_lu_2/StatefulPartitionedCall:output:0batch_normalization_3_10738batch_normalization_3_10740batch_normalization_3_10742batch_normalization_3_10744*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *Y
fTRR
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_101502/
-batch_normalization_3/StatefulPartitionedCallК
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall6batch_normalization_3/StatefulPartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_104972#
!dropout_3/StatefulPartitionedCallх
dense_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0dense_3_10748dense_3_10750*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_104032!
dense_3/StatefulPartitionedCallЃ
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

Identityі
NoOpNoOp,^batch_normalization/StatefulPartitionedCall.^batch_normalization_1/StatefulPartitionedCall.^batch_normalization_2/StatefulPartitionedCall.^batch_normalization_3/StatefulPartitionedCall^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall ^dropout/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall ^p_re_lu/StatefulPartitionedCall"^p_re_lu_1/StatefulPartitionedCall"^p_re_lu_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 2Z
+batch_normalization/StatefulPartitionedCall+batch_normalization/StatefulPartitionedCall2^
-batch_normalization_1/StatefulPartitionedCall-batch_normalization_1/StatefulPartitionedCall2^
-batch_normalization_2/StatefulPartitionedCall-batch_normalization_2/StatefulPartitionedCall2^
-batch_normalization_3/StatefulPartitionedCall-batch_normalization_3/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall2B
p_re_lu/StatefulPartitionedCallp_re_lu/StatefulPartitionedCall2F
!p_re_lu_1/StatefulPartitionedCall!p_re_lu_1/StatefulPartitionedCall2F
!p_re_lu_2/StatefulPartitionedCall!p_re_lu_2/StatefulPartitionedCall:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
Г

З
@__inference_dense_layer_call_and_return_conditional_losses_11644

inputs2
matmul_readvariableop_resource:
├ђ.
biasadd_readvariableop_resource:	ђ
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpЈ
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
├ђ*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
MatMulЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpѓ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2	
BiasAddl
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ├: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
Ч	
Џ
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_11993

inputs%
readvariableop_resource:@
identityѕбReadVariableOpW
ReluReluinputs*
T0*0
_output_shapes
:                  2
Relut
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype02
ReadVariableOpN
NegNegReadVariableOp:value:0*
T0*
_output_shapes
:@2
NegX
Neg_1Neginputs*
T0*0
_output_shapes
:                  2
Neg_1^
Relu_1Relu	Neg_1:y:0*
T0*0
_output_shapes
:                  2
Relu_1b
mulMulNeg:y:0Relu_1:activations:0*
T0*'
_output_shapes
:         @2
mulb
addAddV2Relu:activations:0mul:z:0*
T0*'
_output_shapes
:         @2
addb
IdentityIdentityadd:z:0^NoOp*
T0*'
_output_shapes
:         @2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 2 
ReadVariableOpReadVariableOp:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
Ѓ
░
M__inference_batch_normalization_layer_call_and_return_conditional_losses_9484

inputs0
!batchnorm_readvariableop_resource:	├4
%batchnorm_mul_readvariableop_resource:	├2
#batchnorm_readvariableop_1_resource:	├2
#batchnorm_readvariableop_2_resource:	├
identityѕбbatchnorm/ReadVariableOpбbatchnorm/ReadVariableOp_1бbatchnorm/ReadVariableOp_2бbatchnorm/mul/ReadVariableOpЊ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:├*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЅ
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:├2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:├2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:├*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:├2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ├2
batchnorm/mul_1Ў
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:├*
dtype02
batchnorm/ReadVariableOp_1є
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:├2
batchnorm/mul_2Ў
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:├*
dtype02
batchnorm/ReadVariableOp_2ё
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:├2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ├2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ├2

Identity┬
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ├: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
з
`
B__inference_dropout_layer_call_and_return_conditional_losses_11612

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:         ├2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:         ├2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ├:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
ўН
П
E__inference_sequential_layer_call_and_return_conditional_losses_11409

inputsJ
;batch_normalization_assignmovingavg_readvariableop_resource:	├L
=batch_normalization_assignmovingavg_1_readvariableop_resource:	├H
9batch_normalization_batchnorm_mul_readvariableop_resource:	├D
5batch_normalization_batchnorm_readvariableop_resource:	├8
$dense_matmul_readvariableop_resource:
├ђ4
%dense_biasadd_readvariableop_resource:	ђ.
p_re_lu_readvariableop_resource:	ђL
=batch_normalization_1_assignmovingavg_readvariableop_resource:	ђN
?batch_normalization_1_assignmovingavg_1_readvariableop_resource:	ђJ
;batch_normalization_1_batchnorm_mul_readvariableop_resource:	ђF
7batch_normalization_1_batchnorm_readvariableop_resource:	ђ:
&dense_1_matmul_readvariableop_resource:
ђђ6
'dense_1_biasadd_readvariableop_resource:	ђ0
!p_re_lu_1_readvariableop_resource:	ђL
=batch_normalization_2_assignmovingavg_readvariableop_resource:	ђN
?batch_normalization_2_assignmovingavg_1_readvariableop_resource:	ђJ
;batch_normalization_2_batchnorm_mul_readvariableop_resource:	ђF
7batch_normalization_2_batchnorm_readvariableop_resource:	ђ9
&dense_2_matmul_readvariableop_resource:	ђ@5
'dense_2_biasadd_readvariableop_resource:@/
!p_re_lu_2_readvariableop_resource:@K
=batch_normalization_3_assignmovingavg_readvariableop_resource:@M
?batch_normalization_3_assignmovingavg_1_readvariableop_resource:@I
;batch_normalization_3_batchnorm_mul_readvariableop_resource:@E
7batch_normalization_3_batchnorm_readvariableop_resource:@8
&dense_3_matmul_readvariableop_resource:@5
'dense_3_biasadd_readvariableop_resource:
identityѕб#batch_normalization/AssignMovingAvgб2batch_normalization/AssignMovingAvg/ReadVariableOpб%batch_normalization/AssignMovingAvg_1б4batch_normalization/AssignMovingAvg_1/ReadVariableOpб,batch_normalization/batchnorm/ReadVariableOpб0batch_normalization/batchnorm/mul/ReadVariableOpб%batch_normalization_1/AssignMovingAvgб4batch_normalization_1/AssignMovingAvg/ReadVariableOpб'batch_normalization_1/AssignMovingAvg_1б6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpб.batch_normalization_1/batchnorm/ReadVariableOpб2batch_normalization_1/batchnorm/mul/ReadVariableOpб%batch_normalization_2/AssignMovingAvgб4batch_normalization_2/AssignMovingAvg/ReadVariableOpб'batch_normalization_2/AssignMovingAvg_1б6batch_normalization_2/AssignMovingAvg_1/ReadVariableOpб.batch_normalization_2/batchnorm/ReadVariableOpб2batch_normalization_2/batchnorm/mul/ReadVariableOpб%batch_normalization_3/AssignMovingAvgб4batch_normalization_3/AssignMovingAvg/ReadVariableOpб'batch_normalization_3/AssignMovingAvg_1б6batch_normalization_3/AssignMovingAvg_1/ReadVariableOpб.batch_normalization_3/batchnorm/ReadVariableOpб2batch_normalization_3/batchnorm/mul/ReadVariableOpбdense/BiasAdd/ReadVariableOpбdense/MatMul/ReadVariableOpбdense_1/BiasAdd/ReadVariableOpбdense_1/MatMul/ReadVariableOpбdense_2/BiasAdd/ReadVariableOpбdense_2/MatMul/ReadVariableOpбdense_3/BiasAdd/ReadVariableOpбdense_3/MatMul/ReadVariableOpбp_re_lu/ReadVariableOpбp_re_lu_1/ReadVariableOpбp_re_lu_2/ReadVariableOp▓
2batch_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 24
2batch_normalization/moments/mean/reduction_indices╠
 batch_normalization/moments/meanMeaninputs;batch_normalization/moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	├*
	keep_dims(2"
 batch_normalization/moments/mean╣
(batch_normalization/moments/StopGradientStopGradient)batch_normalization/moments/mean:output:0*
T0*
_output_shapes
:	├2*
(batch_normalization/moments/StopGradientр
-batch_normalization/moments/SquaredDifferenceSquaredDifferenceinputs1batch_normalization/moments/StopGradient:output:0*
T0*(
_output_shapes
:         ├2/
-batch_normalization/moments/SquaredDifference║
6batch_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 28
6batch_normalization/moments/variance/reduction_indicesЃ
$batch_normalization/moments/varianceMean1batch_normalization/moments/SquaredDifference:z:0?batch_normalization/moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	├*
	keep_dims(2&
$batch_normalization/moments/varianceй
#batch_normalization/moments/SqueezeSqueeze)batch_normalization/moments/mean:output:0*
T0*
_output_shapes	
:├*
squeeze_dims
 2%
#batch_normalization/moments/Squeeze┼
%batch_normalization/moments/Squeeze_1Squeeze-batch_normalization/moments/variance:output:0*
T0*
_output_shapes	
:├*
squeeze_dims
 2'
%batch_normalization/moments/Squeeze_1Џ
)batch_normalization/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2+
)batch_normalization/AssignMovingAvg/decayр
2batch_normalization/AssignMovingAvg/ReadVariableOpReadVariableOp;batch_normalization_assignmovingavg_readvariableop_resource*
_output_shapes	
:├*
dtype024
2batch_normalization/AssignMovingAvg/ReadVariableOpж
'batch_normalization/AssignMovingAvg/subSub:batch_normalization/AssignMovingAvg/ReadVariableOp:value:0,batch_normalization/moments/Squeeze:output:0*
T0*
_output_shapes	
:├2)
'batch_normalization/AssignMovingAvg/subЯ
'batch_normalization/AssignMovingAvg/mulMul+batch_normalization/AssignMovingAvg/sub:z:02batch_normalization/AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:├2)
'batch_normalization/AssignMovingAvg/mulБ
#batch_normalization/AssignMovingAvgAssignSubVariableOp;batch_normalization_assignmovingavg_readvariableop_resource+batch_normalization/AssignMovingAvg/mul:z:03^batch_normalization/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02%
#batch_normalization/AssignMovingAvgЪ
+batch_normalization/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2-
+batch_normalization/AssignMovingAvg_1/decayу
4batch_normalization/AssignMovingAvg_1/ReadVariableOpReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource*
_output_shapes	
:├*
dtype026
4batch_normalization/AssignMovingAvg_1/ReadVariableOpы
)batch_normalization/AssignMovingAvg_1/subSub<batch_normalization/AssignMovingAvg_1/ReadVariableOp:value:0.batch_normalization/moments/Squeeze_1:output:0*
T0*
_output_shapes	
:├2+
)batch_normalization/AssignMovingAvg_1/subУ
)batch_normalization/AssignMovingAvg_1/mulMul-batch_normalization/AssignMovingAvg_1/sub:z:04batch_normalization/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:├2+
)batch_normalization/AssignMovingAvg_1/mulГ
%batch_normalization/AssignMovingAvg_1AssignSubVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource-batch_normalization/AssignMovingAvg_1/mul:z:05^batch_normalization/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02'
%batch_normalization/AssignMovingAvg_1Ј
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2%
#batch_normalization/batchnorm/add/yМ
!batch_normalization/batchnorm/addAddV2.batch_normalization/moments/Squeeze_1:output:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes	
:├2#
!batch_normalization/batchnorm/addа
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes	
:├2%
#batch_normalization/batchnorm/Rsqrt█
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes	
:├*
dtype022
0batch_normalization/batchnorm/mul/ReadVariableOpо
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:├2#
!batch_normalization/batchnorm/mul│
#batch_normalization/batchnorm/mul_1Mulinputs%batch_normalization/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ├2%
#batch_normalization/batchnorm/mul_1╠
#batch_normalization/batchnorm/mul_2Mul,batch_normalization/moments/Squeeze:output:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes	
:├2%
#batch_normalization/batchnorm/mul_2¤
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes	
:├*
dtype02.
,batch_normalization/batchnorm/ReadVariableOpм
!batch_normalization/batchnorm/subSub4batch_normalization/batchnorm/ReadVariableOp:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:├2#
!batch_normalization/batchnorm/subо
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ├2%
#batch_normalization/batchnorm/add_1s
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/dropout/ConstГ
dropout/dropout/MulMul'batch_normalization/batchnorm/add_1:z:0dropout/dropout/Const:output:0*
T0*(
_output_shapes
:         ├2
dropout/dropout/MulЁ
dropout/dropout/ShapeShape'batch_normalization/batchnorm/add_1:z:0*
T0*
_output_shapes
:2
dropout/dropout/Shape═
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*(
_output_shapes
:         ├*
dtype02.
,dropout/dropout/random_uniform/RandomUniformЁ
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2 
dropout/dropout/GreaterEqual/y▀
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ├2
dropout/dropout/GreaterEqualў
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ├2
dropout/dropout/CastЏ
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*(
_output_shapes
:         ├2
dropout/dropout/Mul_1А
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
├ђ*
dtype02
dense/MatMul/ReadVariableOpЎ
dense/MatMulMatMuldropout/dropout/Mul_1:z:0#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
dense/MatMulЪ
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
dense/BiasAdd/ReadVariableOpџ
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
dense/BiasAddo
p_re_lu/ReluReludense/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/ReluЇ
p_re_lu/ReadVariableOpReadVariableOpp_re_lu_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
p_re_lu/ReadVariableOpg
p_re_lu/NegNegp_re_lu/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
p_re_lu/Negp
p_re_lu/Neg_1Negdense/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/Neg_1n
p_re_lu/Relu_1Relup_re_lu/Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/Relu_1Ѓ
p_re_lu/mulMulp_re_lu/Neg:y:0p_re_lu/Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/mulЃ
p_re_lu/addAddV2p_re_lu/Relu:activations:0p_re_lu/mul:z:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/addХ
4batch_normalization_1/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 26
4batch_normalization_1/moments/mean/reduction_indices█
"batch_normalization_1/moments/meanMeanp_re_lu/add:z:0=batch_normalization_1/moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2$
"batch_normalization_1/moments/mean┐
*batch_normalization_1/moments/StopGradientStopGradient+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes
:	ђ2,
*batch_normalization_1/moments/StopGradient­
/batch_normalization_1/moments/SquaredDifferenceSquaredDifferencep_re_lu/add:z:03batch_normalization_1/moments/StopGradient:output:0*
T0*(
_output_shapes
:         ђ21
/batch_normalization_1/moments/SquaredDifferenceЙ
8batch_normalization_1/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2:
8batch_normalization_1/moments/variance/reduction_indicesІ
&batch_normalization_1/moments/varianceMean3batch_normalization_1/moments/SquaredDifference:z:0Abatch_normalization_1/moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2(
&batch_normalization_1/moments/variance├
%batch_normalization_1/moments/SqueezeSqueeze+batch_normalization_1/moments/mean:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2'
%batch_normalization_1/moments/Squeeze╦
'batch_normalization_1/moments/Squeeze_1Squeeze/batch_normalization_1/moments/variance:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2)
'batch_normalization_1/moments/Squeeze_1Ъ
+batch_normalization_1/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2-
+batch_normalization_1/AssignMovingAvg/decayу
4batch_normalization_1/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource*
_output_shapes	
:ђ*
dtype026
4batch_normalization_1/AssignMovingAvg/ReadVariableOpы
)batch_normalization_1/AssignMovingAvg/subSub<batch_normalization_1/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_1/moments/Squeeze:output:0*
T0*
_output_shapes	
:ђ2+
)batch_normalization_1/AssignMovingAvg/subУ
)batch_normalization_1/AssignMovingAvg/mulMul-batch_normalization_1/AssignMovingAvg/sub:z:04batch_normalization_1/AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:ђ2+
)batch_normalization_1/AssignMovingAvg/mulГ
%batch_normalization_1/AssignMovingAvgAssignSubVariableOp=batch_normalization_1_assignmovingavg_readvariableop_resource-batch_normalization_1/AssignMovingAvg/mul:z:05^batch_normalization_1/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02'
%batch_normalization_1/AssignMovingAvgБ
-batch_normalization_1/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2/
-batch_normalization_1/AssignMovingAvg_1/decayь
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype028
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOpщ
+batch_normalization_1/AssignMovingAvg_1/subSub>batch_normalization_1/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_1/moments/Squeeze_1:output:0*
T0*
_output_shapes	
:ђ2-
+batch_normalization_1/AssignMovingAvg_1/sub­
+batch_normalization_1/AssignMovingAvg_1/mulMul/batch_normalization_1/AssignMovingAvg_1/sub:z:06batch_normalization_1/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:ђ2-
+batch_normalization_1/AssignMovingAvg_1/mulи
'batch_normalization_1/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_1_assignmovingavg_1_readvariableop_resource/batch_normalization_1/AssignMovingAvg_1/mul:z:07^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02)
'batch_normalization_1/AssignMovingAvg_1Њ
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2'
%batch_normalization_1/batchnorm/add/y█
#batch_normalization_1/batchnorm/addAddV20batch_normalization_1/moments/Squeeze_1:output:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_1/batchnorm/addд
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes	
:ђ2'
%batch_normalization_1/batchnorm/Rsqrtр
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype024
2batch_normalization_1/batchnorm/mul/ReadVariableOpя
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_1/batchnorm/mul┬
%batch_normalization_1/batchnorm/mul_1Mulp_re_lu/add:z:0'batch_normalization_1/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2'
%batch_normalization_1/batchnorm/mul_1н
%batch_normalization_1/batchnorm/mul_2Mul.batch_normalization_1/moments/Squeeze:output:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2'
%batch_normalization_1/batchnorm/mul_2Н
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype020
.batch_normalization_1/batchnorm/ReadVariableOp┌
#batch_normalization_1/batchnorm/subSub6batch_normalization_1/batchnorm/ReadVariableOp:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_1/batchnorm/subя
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2'
%batch_normalization_1/batchnorm/add_1w
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout_1/dropout/Constх
dropout_1/dropout/MulMul)batch_normalization_1/batchnorm/add_1:z:0 dropout_1/dropout/Const:output:0*
T0*(
_output_shapes
:         ђ2
dropout_1/dropout/MulІ
dropout_1/dropout/ShapeShape)batch_normalization_1/batchnorm/add_1:z:0*
T0*
_output_shapes
:2
dropout_1/dropout/ShapeМ
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*(
_output_shapes
:         ђ*
dtype020
.dropout_1/dropout/random_uniform/RandomUniformЅ
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2"
 dropout_1/dropout/GreaterEqual/yу
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ђ2 
dropout_1/dropout/GreaterEqualъ
dropout_1/dropout/CastCast"dropout_1/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ђ2
dropout_1/dropout/CastБ
dropout_1/dropout/Mul_1Muldropout_1/dropout/Mul:z:0dropout_1/dropout/Cast:y:0*
T0*(
_output_shapes
:         ђ2
dropout_1/dropout/Mul_1Д
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
ђђ*
dtype02
dense_1/MatMul/ReadVariableOpА
dense_1/MatMulMatMuldropout_1/dropout/Mul_1:z:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
dense_1/MatMulЦ
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02 
dense_1/BiasAdd/ReadVariableOpб
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
dense_1/BiasAddu
p_re_lu_1/ReluReludense_1/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/ReluЊ
p_re_lu_1/ReadVariableOpReadVariableOp!p_re_lu_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
p_re_lu_1/ReadVariableOpm
p_re_lu_1/NegNeg p_re_lu_1/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
p_re_lu_1/Negv
p_re_lu_1/Neg_1Negdense_1/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/Neg_1t
p_re_lu_1/Relu_1Relup_re_lu_1/Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/Relu_1І
p_re_lu_1/mulMulp_re_lu_1/Neg:y:0p_re_lu_1/Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/mulІ
p_re_lu_1/addAddV2p_re_lu_1/Relu:activations:0p_re_lu_1/mul:z:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/addХ
4batch_normalization_2/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 26
4batch_normalization_2/moments/mean/reduction_indicesП
"batch_normalization_2/moments/meanMeanp_re_lu_1/add:z:0=batch_normalization_2/moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2$
"batch_normalization_2/moments/mean┐
*batch_normalization_2/moments/StopGradientStopGradient+batch_normalization_2/moments/mean:output:0*
T0*
_output_shapes
:	ђ2,
*batch_normalization_2/moments/StopGradientЫ
/batch_normalization_2/moments/SquaredDifferenceSquaredDifferencep_re_lu_1/add:z:03batch_normalization_2/moments/StopGradient:output:0*
T0*(
_output_shapes
:         ђ21
/batch_normalization_2/moments/SquaredDifferenceЙ
8batch_normalization_2/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2:
8batch_normalization_2/moments/variance/reduction_indicesІ
&batch_normalization_2/moments/varianceMean3batch_normalization_2/moments/SquaredDifference:z:0Abatch_normalization_2/moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2(
&batch_normalization_2/moments/variance├
%batch_normalization_2/moments/SqueezeSqueeze+batch_normalization_2/moments/mean:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2'
%batch_normalization_2/moments/Squeeze╦
'batch_normalization_2/moments/Squeeze_1Squeeze/batch_normalization_2/moments/variance:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2)
'batch_normalization_2/moments/Squeeze_1Ъ
+batch_normalization_2/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2-
+batch_normalization_2/AssignMovingAvg/decayу
4batch_normalization_2/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_2_assignmovingavg_readvariableop_resource*
_output_shapes	
:ђ*
dtype026
4batch_normalization_2/AssignMovingAvg/ReadVariableOpы
)batch_normalization_2/AssignMovingAvg/subSub<batch_normalization_2/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_2/moments/Squeeze:output:0*
T0*
_output_shapes	
:ђ2+
)batch_normalization_2/AssignMovingAvg/subУ
)batch_normalization_2/AssignMovingAvg/mulMul-batch_normalization_2/AssignMovingAvg/sub:z:04batch_normalization_2/AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:ђ2+
)batch_normalization_2/AssignMovingAvg/mulГ
%batch_normalization_2/AssignMovingAvgAssignSubVariableOp=batch_normalization_2_assignmovingavg_readvariableop_resource-batch_normalization_2/AssignMovingAvg/mul:z:05^batch_normalization_2/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02'
%batch_normalization_2/AssignMovingAvgБ
-batch_normalization_2/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2/
-batch_normalization_2/AssignMovingAvg_1/decayь
6batch_normalization_2/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_2_assignmovingavg_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype028
6batch_normalization_2/AssignMovingAvg_1/ReadVariableOpщ
+batch_normalization_2/AssignMovingAvg_1/subSub>batch_normalization_2/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_2/moments/Squeeze_1:output:0*
T0*
_output_shapes	
:ђ2-
+batch_normalization_2/AssignMovingAvg_1/sub­
+batch_normalization_2/AssignMovingAvg_1/mulMul/batch_normalization_2/AssignMovingAvg_1/sub:z:06batch_normalization_2/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:ђ2-
+batch_normalization_2/AssignMovingAvg_1/mulи
'batch_normalization_2/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_2_assignmovingavg_1_readvariableop_resource/batch_normalization_2/AssignMovingAvg_1/mul:z:07^batch_normalization_2/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02)
'batch_normalization_2/AssignMovingAvg_1Њ
%batch_normalization_2/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2'
%batch_normalization_2/batchnorm/add/y█
#batch_normalization_2/batchnorm/addAddV20batch_normalization_2/moments/Squeeze_1:output:0.batch_normalization_2/batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_2/batchnorm/addд
%batch_normalization_2/batchnorm/RsqrtRsqrt'batch_normalization_2/batchnorm/add:z:0*
T0*
_output_shapes	
:ђ2'
%batch_normalization_2/batchnorm/Rsqrtр
2batch_normalization_2/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_2_batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype024
2batch_normalization_2/batchnorm/mul/ReadVariableOpя
#batch_normalization_2/batchnorm/mulMul)batch_normalization_2/batchnorm/Rsqrt:y:0:batch_normalization_2/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_2/batchnorm/mul─
%batch_normalization_2/batchnorm/mul_1Mulp_re_lu_1/add:z:0'batch_normalization_2/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2'
%batch_normalization_2/batchnorm/mul_1н
%batch_normalization_2/batchnorm/mul_2Mul.batch_normalization_2/moments/Squeeze:output:0'batch_normalization_2/batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2'
%batch_normalization_2/batchnorm/mul_2Н
.batch_normalization_2/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_2_batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype020
.batch_normalization_2/batchnorm/ReadVariableOp┌
#batch_normalization_2/batchnorm/subSub6batch_normalization_2/batchnorm/ReadVariableOp:value:0)batch_normalization_2/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_2/batchnorm/subя
%batch_normalization_2/batchnorm/add_1AddV2)batch_normalization_2/batchnorm/mul_1:z:0'batch_normalization_2/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2'
%batch_normalization_2/batchnorm/add_1w
dropout_2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout_2/dropout/Constх
dropout_2/dropout/MulMul)batch_normalization_2/batchnorm/add_1:z:0 dropout_2/dropout/Const:output:0*
T0*(
_output_shapes
:         ђ2
dropout_2/dropout/MulІ
dropout_2/dropout/ShapeShape)batch_normalization_2/batchnorm/add_1:z:0*
T0*
_output_shapes
:2
dropout_2/dropout/ShapeМ
.dropout_2/dropout/random_uniform/RandomUniformRandomUniform dropout_2/dropout/Shape:output:0*
T0*(
_output_shapes
:         ђ*
dtype020
.dropout_2/dropout/random_uniform/RandomUniformЅ
 dropout_2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2"
 dropout_2/dropout/GreaterEqual/yу
dropout_2/dropout/GreaterEqualGreaterEqual7dropout_2/dropout/random_uniform/RandomUniform:output:0)dropout_2/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ђ2 
dropout_2/dropout/GreaterEqualъ
dropout_2/dropout/CastCast"dropout_2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ђ2
dropout_2/dropout/CastБ
dropout_2/dropout/Mul_1Muldropout_2/dropout/Mul:z:0dropout_2/dropout/Cast:y:0*
T0*(
_output_shapes
:         ђ2
dropout_2/dropout/Mul_1д
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes
:	ђ@*
dtype02
dense_2/MatMul/ReadVariableOpа
dense_2/MatMulMatMuldropout_2/dropout/Mul_1:z:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2
dense_2/MatMulц
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02 
dense_2/BiasAdd/ReadVariableOpА
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2
dense_2/BiasAddt
p_re_lu_2/ReluReludense_2/BiasAdd:output:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/Reluњ
p_re_lu_2/ReadVariableOpReadVariableOp!p_re_lu_2_readvariableop_resource*
_output_shapes
:@*
dtype02
p_re_lu_2/ReadVariableOpl
p_re_lu_2/NegNeg p_re_lu_2/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
p_re_lu_2/Negu
p_re_lu_2/Neg_1Negdense_2/BiasAdd:output:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/Neg_1s
p_re_lu_2/Relu_1Relup_re_lu_2/Neg_1:y:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/Relu_1і
p_re_lu_2/mulMulp_re_lu_2/Neg:y:0p_re_lu_2/Relu_1:activations:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/mulі
p_re_lu_2/addAddV2p_re_lu_2/Relu:activations:0p_re_lu_2/mul:z:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/addХ
4batch_normalization_3/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 26
4batch_normalization_3/moments/mean/reduction_indices▄
"batch_normalization_3/moments/meanMeanp_re_lu_2/add:z:0=batch_normalization_3/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2$
"batch_normalization_3/moments/meanЙ
*batch_normalization_3/moments/StopGradientStopGradient+batch_normalization_3/moments/mean:output:0*
T0*
_output_shapes

:@2,
*batch_normalization_3/moments/StopGradientы
/batch_normalization_3/moments/SquaredDifferenceSquaredDifferencep_re_lu_2/add:z:03batch_normalization_3/moments/StopGradient:output:0*
T0*'
_output_shapes
:         @21
/batch_normalization_3/moments/SquaredDifferenceЙ
8batch_normalization_3/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2:
8batch_normalization_3/moments/variance/reduction_indicesі
&batch_normalization_3/moments/varianceMean3batch_normalization_3/moments/SquaredDifference:z:0Abatch_normalization_3/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2(
&batch_normalization_3/moments/variance┬
%batch_normalization_3/moments/SqueezeSqueeze+batch_normalization_3/moments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2'
%batch_normalization_3/moments/Squeeze╩
'batch_normalization_3/moments/Squeeze_1Squeeze/batch_normalization_3/moments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2)
'batch_normalization_3/moments/Squeeze_1Ъ
+batch_normalization_3/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2-
+batch_normalization_3/AssignMovingAvg/decayТ
4batch_normalization_3/AssignMovingAvg/ReadVariableOpReadVariableOp=batch_normalization_3_assignmovingavg_readvariableop_resource*
_output_shapes
:@*
dtype026
4batch_normalization_3/AssignMovingAvg/ReadVariableOp­
)batch_normalization_3/AssignMovingAvg/subSub<batch_normalization_3/AssignMovingAvg/ReadVariableOp:value:0.batch_normalization_3/moments/Squeeze:output:0*
T0*
_output_shapes
:@2+
)batch_normalization_3/AssignMovingAvg/subу
)batch_normalization_3/AssignMovingAvg/mulMul-batch_normalization_3/AssignMovingAvg/sub:z:04batch_normalization_3/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:@2+
)batch_normalization_3/AssignMovingAvg/mulГ
%batch_normalization_3/AssignMovingAvgAssignSubVariableOp=batch_normalization_3_assignmovingavg_readvariableop_resource-batch_normalization_3/AssignMovingAvg/mul:z:05^batch_normalization_3/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02'
%batch_normalization_3/AssignMovingAvgБ
-batch_normalization_3/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2/
-batch_normalization_3/AssignMovingAvg_1/decayВ
6batch_normalization_3/AssignMovingAvg_1/ReadVariableOpReadVariableOp?batch_normalization_3_assignmovingavg_1_readvariableop_resource*
_output_shapes
:@*
dtype028
6batch_normalization_3/AssignMovingAvg_1/ReadVariableOpЭ
+batch_normalization_3/AssignMovingAvg_1/subSub>batch_normalization_3/AssignMovingAvg_1/ReadVariableOp:value:00batch_normalization_3/moments/Squeeze_1:output:0*
T0*
_output_shapes
:@2-
+batch_normalization_3/AssignMovingAvg_1/sub№
+batch_normalization_3/AssignMovingAvg_1/mulMul/batch_normalization_3/AssignMovingAvg_1/sub:z:06batch_normalization_3/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:@2-
+batch_normalization_3/AssignMovingAvg_1/mulи
'batch_normalization_3/AssignMovingAvg_1AssignSubVariableOp?batch_normalization_3_assignmovingavg_1_readvariableop_resource/batch_normalization_3/AssignMovingAvg_1/mul:z:07^batch_normalization_3/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02)
'batch_normalization_3/AssignMovingAvg_1Њ
%batch_normalization_3/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2'
%batch_normalization_3/batchnorm/add/y┌
#batch_normalization_3/batchnorm/addAddV20batch_normalization_3/moments/Squeeze_1:output:0.batch_normalization_3/batchnorm/add/y:output:0*
T0*
_output_shapes
:@2%
#batch_normalization_3/batchnorm/addЦ
%batch_normalization_3/batchnorm/RsqrtRsqrt'batch_normalization_3/batchnorm/add:z:0*
T0*
_output_shapes
:@2'
%batch_normalization_3/batchnorm/RsqrtЯ
2batch_normalization_3/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_3_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype024
2batch_normalization_3/batchnorm/mul/ReadVariableOpП
#batch_normalization_3/batchnorm/mulMul)batch_normalization_3/batchnorm/Rsqrt:y:0:batch_normalization_3/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2%
#batch_normalization_3/batchnorm/mul├
%batch_normalization_3/batchnorm/mul_1Mulp_re_lu_2/add:z:0'batch_normalization_3/batchnorm/mul:z:0*
T0*'
_output_shapes
:         @2'
%batch_normalization_3/batchnorm/mul_1М
%batch_normalization_3/batchnorm/mul_2Mul.batch_normalization_3/moments/Squeeze:output:0'batch_normalization_3/batchnorm/mul:z:0*
T0*
_output_shapes
:@2'
%batch_normalization_3/batchnorm/mul_2н
.batch_normalization_3/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_3_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype020
.batch_normalization_3/batchnorm/ReadVariableOp┘
#batch_normalization_3/batchnorm/subSub6batch_normalization_3/batchnorm/ReadVariableOp:value:0)batch_normalization_3/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2%
#batch_normalization_3/batchnorm/subП
%batch_normalization_3/batchnorm/add_1AddV2)batch_normalization_3/batchnorm/mul_1:z:0'batch_normalization_3/batchnorm/sub:z:0*
T0*'
_output_shapes
:         @2'
%batch_normalization_3/batchnorm/add_1w
dropout_3/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout_3/dropout/Const┤
dropout_3/dropout/MulMul)batch_normalization_3/batchnorm/add_1:z:0 dropout_3/dropout/Const:output:0*
T0*'
_output_shapes
:         @2
dropout_3/dropout/MulІ
dropout_3/dropout/ShapeShape)batch_normalization_3/batchnorm/add_1:z:0*
T0*
_output_shapes
:2
dropout_3/dropout/Shapeм
.dropout_3/dropout/random_uniform/RandomUniformRandomUniform dropout_3/dropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype020
.dropout_3/dropout/random_uniform/RandomUniformЅ
 dropout_3/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2"
 dropout_3/dropout/GreaterEqual/yТ
dropout_3/dropout/GreaterEqualGreaterEqual7dropout_3/dropout/random_uniform/RandomUniform:output:0)dropout_3/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @2 
dropout_3/dropout/GreaterEqualЮ
dropout_3/dropout/CastCast"dropout_3/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @2
dropout_3/dropout/Castб
dropout_3/dropout/Mul_1Muldropout_3/dropout/Mul:z:0dropout_3/dropout/Cast:y:0*
T0*'
_output_shapes
:         @2
dropout_3/dropout/Mul_1Ц
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:@*
dtype02
dense_3/MatMul/ReadVariableOpа
dense_3/MatMulMatMuldropout_3/dropout/Mul_1:z:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
dense_3/MatMulц
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02 
dense_3/BiasAdd/ReadVariableOpА
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
dense_3/BiasAdd|
dense_3/SoftplusSoftplusdense_3/BiasAdd:output:0*
T0*'
_output_shapes
:         2
dense_3/Softplusy
IdentityIdentitydense_3/Softplus:activations:0^NoOp*
T0*'
_output_shapes
:         2

Identity▒
NoOpNoOp$^batch_normalization/AssignMovingAvg3^batch_normalization/AssignMovingAvg/ReadVariableOp&^batch_normalization/AssignMovingAvg_15^batch_normalization/AssignMovingAvg_1/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp1^batch_normalization/batchnorm/mul/ReadVariableOp&^batch_normalization_1/AssignMovingAvg5^batch_normalization_1/AssignMovingAvg/ReadVariableOp(^batch_normalization_1/AssignMovingAvg_17^batch_normalization_1/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp3^batch_normalization_1/batchnorm/mul/ReadVariableOp&^batch_normalization_2/AssignMovingAvg5^batch_normalization_2/AssignMovingAvg/ReadVariableOp(^batch_normalization_2/AssignMovingAvg_17^batch_normalization_2/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_2/batchnorm/ReadVariableOp3^batch_normalization_2/batchnorm/mul/ReadVariableOp&^batch_normalization_3/AssignMovingAvg5^batch_normalization_3/AssignMovingAvg/ReadVariableOp(^batch_normalization_3/AssignMovingAvg_17^batch_normalization_3/AssignMovingAvg_1/ReadVariableOp/^batch_normalization_3/batchnorm/ReadVariableOp3^batch_normalization_3/batchnorm/mul/ReadVariableOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp^p_re_lu/ReadVariableOp^p_re_lu_1/ReadVariableOp^p_re_lu_2/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 2J
#batch_normalization/AssignMovingAvg#batch_normalization/AssignMovingAvg2h
2batch_normalization/AssignMovingAvg/ReadVariableOp2batch_normalization/AssignMovingAvg/ReadVariableOp2N
%batch_normalization/AssignMovingAvg_1%batch_normalization/AssignMovingAvg_12l
4batch_normalization/AssignMovingAvg_1/ReadVariableOp4batch_normalization/AssignMovingAvg_1/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2N
%batch_normalization_1/AssignMovingAvg%batch_normalization_1/AssignMovingAvg2l
4batch_normalization_1/AssignMovingAvg/ReadVariableOp4batch_normalization_1/AssignMovingAvg/ReadVariableOp2R
'batch_normalization_1/AssignMovingAvg_1'batch_normalization_1/AssignMovingAvg_12p
6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp6batch_normalization_1/AssignMovingAvg_1/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2N
%batch_normalization_2/AssignMovingAvg%batch_normalization_2/AssignMovingAvg2l
4batch_normalization_2/AssignMovingAvg/ReadVariableOp4batch_normalization_2/AssignMovingAvg/ReadVariableOp2R
'batch_normalization_2/AssignMovingAvg_1'batch_normalization_2/AssignMovingAvg_12p
6batch_normalization_2/AssignMovingAvg_1/ReadVariableOp6batch_normalization_2/AssignMovingAvg_1/ReadVariableOp2`
.batch_normalization_2/batchnorm/ReadVariableOp.batch_normalization_2/batchnorm/ReadVariableOp2h
2batch_normalization_2/batchnorm/mul/ReadVariableOp2batch_normalization_2/batchnorm/mul/ReadVariableOp2N
%batch_normalization_3/AssignMovingAvg%batch_normalization_3/AssignMovingAvg2l
4batch_normalization_3/AssignMovingAvg/ReadVariableOp4batch_normalization_3/AssignMovingAvg/ReadVariableOp2R
'batch_normalization_3/AssignMovingAvg_1'batch_normalization_3/AssignMovingAvg_12p
6batch_normalization_3/AssignMovingAvg_1/ReadVariableOp6batch_normalization_3/AssignMovingAvg_1/ReadVariableOp2`
.batch_normalization_3/batchnorm/ReadVariableOp.batch_normalization_3/batchnorm/ReadVariableOp2h
2batch_normalization_3/batchnorm/mul/ReadVariableOp2batch_normalization_3/batchnorm/mul/ReadVariableOp2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp20
p_re_lu/ReadVariableOpp_re_lu/ReadVariableOp24
p_re_lu_1/ReadVariableOpp_re_lu_1/ReadVariableOp24
p_re_lu_2/ReadVariableOpp_re_lu_2/ReadVariableOp:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
щ
│
#__inference_signature_wrapper_11083
input_1
unknown:	├
	unknown_0:	├
	unknown_1:	├
	unknown_2:	├
	unknown_3:
├ђ
	unknown_4:	ђ
	unknown_5:	ђ
	unknown_6:	ђ
	unknown_7:	ђ
	unknown_8:	ђ
	unknown_9:	ђ

unknown_10:
ђђ

unknown_11:	ђ

unknown_12:	ђ

unknown_13:	ђ

unknown_14:	ђ

unknown_15:	ђ

unknown_16:	ђ

unknown_17:	ђ@

unknown_18:@

unknown_19:@

unknown_20:@

unknown_21:@

unknown_22:@

unknown_23:@

unknown_24:@

unknown_25:
identityѕбStatefulPartitionedCallф
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25*'
Tin 
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *=
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *(
f#R!
__inference__wrapped_model_94602
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:         ├
!
_user_specified_name	input_1
Г

З
@__inference_dense_layer_call_and_return_conditional_losses_10261

inputs2
matmul_readvariableop_resource:
├ђ.
biasadd_readvariableop_resource:	ђ
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpЈ
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
├ђ*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
MatMulЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpѓ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2	
BiasAddl
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ├: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
▀
н
5__inference_batch_normalization_1_layer_call_fn_11771

inputs
unknown:	ђ
	unknown_0:	ђ
	unknown_1:	ђ
	unknown_2:	ђ
identityѕбStatefulPartitionedCallЮ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_1_layer_call_and_return_conditional_losses_97462
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
ј│
╔
E__inference_sequential_layer_call_and_return_conditional_losses_11204

inputsD
5batch_normalization_batchnorm_readvariableop_resource:	├H
9batch_normalization_batchnorm_mul_readvariableop_resource:	├F
7batch_normalization_batchnorm_readvariableop_1_resource:	├F
7batch_normalization_batchnorm_readvariableop_2_resource:	├8
$dense_matmul_readvariableop_resource:
├ђ4
%dense_biasadd_readvariableop_resource:	ђ.
p_re_lu_readvariableop_resource:	ђF
7batch_normalization_1_batchnorm_readvariableop_resource:	ђJ
;batch_normalization_1_batchnorm_mul_readvariableop_resource:	ђH
9batch_normalization_1_batchnorm_readvariableop_1_resource:	ђH
9batch_normalization_1_batchnorm_readvariableop_2_resource:	ђ:
&dense_1_matmul_readvariableop_resource:
ђђ6
'dense_1_biasadd_readvariableop_resource:	ђ0
!p_re_lu_1_readvariableop_resource:	ђF
7batch_normalization_2_batchnorm_readvariableop_resource:	ђJ
;batch_normalization_2_batchnorm_mul_readvariableop_resource:	ђH
9batch_normalization_2_batchnorm_readvariableop_1_resource:	ђH
9batch_normalization_2_batchnorm_readvariableop_2_resource:	ђ9
&dense_2_matmul_readvariableop_resource:	ђ@5
'dense_2_biasadd_readvariableop_resource:@/
!p_re_lu_2_readvariableop_resource:@E
7batch_normalization_3_batchnorm_readvariableop_resource:@I
;batch_normalization_3_batchnorm_mul_readvariableop_resource:@G
9batch_normalization_3_batchnorm_readvariableop_1_resource:@G
9batch_normalization_3_batchnorm_readvariableop_2_resource:@8
&dense_3_matmul_readvariableop_resource:@5
'dense_3_biasadd_readvariableop_resource:
identityѕб,batch_normalization/batchnorm/ReadVariableOpб.batch_normalization/batchnorm/ReadVariableOp_1б.batch_normalization/batchnorm/ReadVariableOp_2б0batch_normalization/batchnorm/mul/ReadVariableOpб.batch_normalization_1/batchnorm/ReadVariableOpб0batch_normalization_1/batchnorm/ReadVariableOp_1б0batch_normalization_1/batchnorm/ReadVariableOp_2б2batch_normalization_1/batchnorm/mul/ReadVariableOpб.batch_normalization_2/batchnorm/ReadVariableOpб0batch_normalization_2/batchnorm/ReadVariableOp_1б0batch_normalization_2/batchnorm/ReadVariableOp_2б2batch_normalization_2/batchnorm/mul/ReadVariableOpб.batch_normalization_3/batchnorm/ReadVariableOpб0batch_normalization_3/batchnorm/ReadVariableOp_1б0batch_normalization_3/batchnorm/ReadVariableOp_2б2batch_normalization_3/batchnorm/mul/ReadVariableOpбdense/BiasAdd/ReadVariableOpбdense/MatMul/ReadVariableOpбdense_1/BiasAdd/ReadVariableOpбdense_1/MatMul/ReadVariableOpбdense_2/BiasAdd/ReadVariableOpбdense_2/MatMul/ReadVariableOpбdense_3/BiasAdd/ReadVariableOpбdense_3/MatMul/ReadVariableOpбp_re_lu/ReadVariableOpбp_re_lu_1/ReadVariableOpбp_re_lu_2/ReadVariableOp¤
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes	
:├*
dtype02.
,batch_normalization/batchnorm/ReadVariableOpЈ
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2%
#batch_normalization/batchnorm/add/y┘
!batch_normalization/batchnorm/addAddV24batch_normalization/batchnorm/ReadVariableOp:value:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes	
:├2#
!batch_normalization/batchnorm/addа
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes	
:├2%
#batch_normalization/batchnorm/Rsqrt█
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes	
:├*
dtype022
0batch_normalization/batchnorm/mul/ReadVariableOpо
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:├2#
!batch_normalization/batchnorm/mul│
#batch_normalization/batchnorm/mul_1Mulinputs%batch_normalization/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ├2%
#batch_normalization/batchnorm/mul_1Н
.batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOp7batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes	
:├*
dtype020
.batch_normalization/batchnorm/ReadVariableOp_1о
#batch_normalization/batchnorm/mul_2Mul6batch_normalization/batchnorm/ReadVariableOp_1:value:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes	
:├2%
#batch_normalization/batchnorm/mul_2Н
.batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOp7batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes	
:├*
dtype020
.batch_normalization/batchnorm/ReadVariableOp_2н
!batch_normalization/batchnorm/subSub6batch_normalization/batchnorm/ReadVariableOp_2:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:├2#
!batch_normalization/batchnorm/subо
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ├2%
#batch_normalization/batchnorm/add_1ї
dropout/IdentityIdentity'batch_normalization/batchnorm/add_1:z:0*
T0*(
_output_shapes
:         ├2
dropout/IdentityА
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
├ђ*
dtype02
dense/MatMul/ReadVariableOpЎ
dense/MatMulMatMuldropout/Identity:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
dense/MatMulЪ
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
dense/BiasAdd/ReadVariableOpџ
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
dense/BiasAddo
p_re_lu/ReluReludense/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/ReluЇ
p_re_lu/ReadVariableOpReadVariableOpp_re_lu_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
p_re_lu/ReadVariableOpg
p_re_lu/NegNegp_re_lu/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
p_re_lu/Negp
p_re_lu/Neg_1Negdense/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/Neg_1n
p_re_lu/Relu_1Relup_re_lu/Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/Relu_1Ѓ
p_re_lu/mulMulp_re_lu/Neg:y:0p_re_lu/Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/mulЃ
p_re_lu/addAddV2p_re_lu/Relu:activations:0p_re_lu/mul:z:0*
T0*(
_output_shapes
:         ђ2
p_re_lu/addН
.batch_normalization_1/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype020
.batch_normalization_1/batchnorm/ReadVariableOpЊ
%batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2'
%batch_normalization_1/batchnorm/add/yр
#batch_normalization_1/batchnorm/addAddV26batch_normalization_1/batchnorm/ReadVariableOp:value:0.batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_1/batchnorm/addд
%batch_normalization_1/batchnorm/RsqrtRsqrt'batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes	
:ђ2'
%batch_normalization_1/batchnorm/Rsqrtр
2batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype024
2batch_normalization_1/batchnorm/mul/ReadVariableOpя
#batch_normalization_1/batchnorm/mulMul)batch_normalization_1/batchnorm/Rsqrt:y:0:batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_1/batchnorm/mul┬
%batch_normalization_1/batchnorm/mul_1Mulp_re_lu/add:z:0'batch_normalization_1/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2'
%batch_normalization_1/batchnorm/mul_1█
0batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes	
:ђ*
dtype022
0batch_normalization_1/batchnorm/ReadVariableOp_1я
%batch_normalization_1/batchnorm/mul_2Mul8batch_normalization_1/batchnorm/ReadVariableOp_1:value:0'batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2'
%batch_normalization_1/batchnorm/mul_2█
0batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes	
:ђ*
dtype022
0batch_normalization_1/batchnorm/ReadVariableOp_2▄
#batch_normalization_1/batchnorm/subSub8batch_normalization_1/batchnorm/ReadVariableOp_2:value:0)batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_1/batchnorm/subя
%batch_normalization_1/batchnorm/add_1AddV2)batch_normalization_1/batchnorm/mul_1:z:0'batch_normalization_1/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2'
%batch_normalization_1/batchnorm/add_1њ
dropout_1/IdentityIdentity)batch_normalization_1/batchnorm/add_1:z:0*
T0*(
_output_shapes
:         ђ2
dropout_1/IdentityД
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
ђђ*
dtype02
dense_1/MatMul/ReadVariableOpА
dense_1/MatMulMatMuldropout_1/Identity:output:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
dense_1/MatMulЦ
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02 
dense_1/BiasAdd/ReadVariableOpб
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
dense_1/BiasAddu
p_re_lu_1/ReluReludense_1/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/ReluЊ
p_re_lu_1/ReadVariableOpReadVariableOp!p_re_lu_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
p_re_lu_1/ReadVariableOpm
p_re_lu_1/NegNeg p_re_lu_1/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
p_re_lu_1/Negv
p_re_lu_1/Neg_1Negdense_1/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/Neg_1t
p_re_lu_1/Relu_1Relup_re_lu_1/Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/Relu_1І
p_re_lu_1/mulMulp_re_lu_1/Neg:y:0p_re_lu_1/Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/mulІ
p_re_lu_1/addAddV2p_re_lu_1/Relu:activations:0p_re_lu_1/mul:z:0*
T0*(
_output_shapes
:         ђ2
p_re_lu_1/addН
.batch_normalization_2/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_2_batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype020
.batch_normalization_2/batchnorm/ReadVariableOpЊ
%batch_normalization_2/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2'
%batch_normalization_2/batchnorm/add/yр
#batch_normalization_2/batchnorm/addAddV26batch_normalization_2/batchnorm/ReadVariableOp:value:0.batch_normalization_2/batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_2/batchnorm/addд
%batch_normalization_2/batchnorm/RsqrtRsqrt'batch_normalization_2/batchnorm/add:z:0*
T0*
_output_shapes	
:ђ2'
%batch_normalization_2/batchnorm/Rsqrtр
2batch_normalization_2/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_2_batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype024
2batch_normalization_2/batchnorm/mul/ReadVariableOpя
#batch_normalization_2/batchnorm/mulMul)batch_normalization_2/batchnorm/Rsqrt:y:0:batch_normalization_2/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_2/batchnorm/mul─
%batch_normalization_2/batchnorm/mul_1Mulp_re_lu_1/add:z:0'batch_normalization_2/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2'
%batch_normalization_2/batchnorm/mul_1█
0batch_normalization_2/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_2_batchnorm_readvariableop_1_resource*
_output_shapes	
:ђ*
dtype022
0batch_normalization_2/batchnorm/ReadVariableOp_1я
%batch_normalization_2/batchnorm/mul_2Mul8batch_normalization_2/batchnorm/ReadVariableOp_1:value:0'batch_normalization_2/batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2'
%batch_normalization_2/batchnorm/mul_2█
0batch_normalization_2/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_2_batchnorm_readvariableop_2_resource*
_output_shapes	
:ђ*
dtype022
0batch_normalization_2/batchnorm/ReadVariableOp_2▄
#batch_normalization_2/batchnorm/subSub8batch_normalization_2/batchnorm/ReadVariableOp_2:value:0)batch_normalization_2/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2%
#batch_normalization_2/batchnorm/subя
%batch_normalization_2/batchnorm/add_1AddV2)batch_normalization_2/batchnorm/mul_1:z:0'batch_normalization_2/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2'
%batch_normalization_2/batchnorm/add_1њ
dropout_2/IdentityIdentity)batch_normalization_2/batchnorm/add_1:z:0*
T0*(
_output_shapes
:         ђ2
dropout_2/Identityд
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes
:	ђ@*
dtype02
dense_2/MatMul/ReadVariableOpа
dense_2/MatMulMatMuldropout_2/Identity:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2
dense_2/MatMulц
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02 
dense_2/BiasAdd/ReadVariableOpА
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2
dense_2/BiasAddt
p_re_lu_2/ReluReludense_2/BiasAdd:output:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/Reluњ
p_re_lu_2/ReadVariableOpReadVariableOp!p_re_lu_2_readvariableop_resource*
_output_shapes
:@*
dtype02
p_re_lu_2/ReadVariableOpl
p_re_lu_2/NegNeg p_re_lu_2/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
p_re_lu_2/Negu
p_re_lu_2/Neg_1Negdense_2/BiasAdd:output:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/Neg_1s
p_re_lu_2/Relu_1Relup_re_lu_2/Neg_1:y:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/Relu_1і
p_re_lu_2/mulMulp_re_lu_2/Neg:y:0p_re_lu_2/Relu_1:activations:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/mulі
p_re_lu_2/addAddV2p_re_lu_2/Relu:activations:0p_re_lu_2/mul:z:0*
T0*'
_output_shapes
:         @2
p_re_lu_2/addн
.batch_normalization_3/batchnorm/ReadVariableOpReadVariableOp7batch_normalization_3_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype020
.batch_normalization_3/batchnorm/ReadVariableOpЊ
%batch_normalization_3/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2'
%batch_normalization_3/batchnorm/add/yЯ
#batch_normalization_3/batchnorm/addAddV26batch_normalization_3/batchnorm/ReadVariableOp:value:0.batch_normalization_3/batchnorm/add/y:output:0*
T0*
_output_shapes
:@2%
#batch_normalization_3/batchnorm/addЦ
%batch_normalization_3/batchnorm/RsqrtRsqrt'batch_normalization_3/batchnorm/add:z:0*
T0*
_output_shapes
:@2'
%batch_normalization_3/batchnorm/RsqrtЯ
2batch_normalization_3/batchnorm/mul/ReadVariableOpReadVariableOp;batch_normalization_3_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype024
2batch_normalization_3/batchnorm/mul/ReadVariableOpП
#batch_normalization_3/batchnorm/mulMul)batch_normalization_3/batchnorm/Rsqrt:y:0:batch_normalization_3/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2%
#batch_normalization_3/batchnorm/mul├
%batch_normalization_3/batchnorm/mul_1Mulp_re_lu_2/add:z:0'batch_normalization_3/batchnorm/mul:z:0*
T0*'
_output_shapes
:         @2'
%batch_normalization_3/batchnorm/mul_1┌
0batch_normalization_3/batchnorm/ReadVariableOp_1ReadVariableOp9batch_normalization_3_batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype022
0batch_normalization_3/batchnorm/ReadVariableOp_1П
%batch_normalization_3/batchnorm/mul_2Mul8batch_normalization_3/batchnorm/ReadVariableOp_1:value:0'batch_normalization_3/batchnorm/mul:z:0*
T0*
_output_shapes
:@2'
%batch_normalization_3/batchnorm/mul_2┌
0batch_normalization_3/batchnorm/ReadVariableOp_2ReadVariableOp9batch_normalization_3_batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype022
0batch_normalization_3/batchnorm/ReadVariableOp_2█
#batch_normalization_3/batchnorm/subSub8batch_normalization_3/batchnorm/ReadVariableOp_2:value:0)batch_normalization_3/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2%
#batch_normalization_3/batchnorm/subП
%batch_normalization_3/batchnorm/add_1AddV2)batch_normalization_3/batchnorm/mul_1:z:0'batch_normalization_3/batchnorm/sub:z:0*
T0*'
_output_shapes
:         @2'
%batch_normalization_3/batchnorm/add_1Љ
dropout_3/IdentityIdentity)batch_normalization_3/batchnorm/add_1:z:0*
T0*'
_output_shapes
:         @2
dropout_3/IdentityЦ
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:@*
dtype02
dense_3/MatMul/ReadVariableOpа
dense_3/MatMulMatMuldropout_3/Identity:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
dense_3/MatMulц
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02 
dense_3/BiasAdd/ReadVariableOpА
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
dense_3/BiasAdd|
dense_3/SoftplusSoftplusdense_3/BiasAdd:output:0*
T0*'
_output_shapes
:         2
dense_3/Softplusy
IdentityIdentitydense_3/Softplus:activations:0^NoOp*
T0*'
_output_shapes
:         2

Identity┼	
NoOpNoOp-^batch_normalization/batchnorm/ReadVariableOp/^batch_normalization/batchnorm/ReadVariableOp_1/^batch_normalization/batchnorm/ReadVariableOp_21^batch_normalization/batchnorm/mul/ReadVariableOp/^batch_normalization_1/batchnorm/ReadVariableOp1^batch_normalization_1/batchnorm/ReadVariableOp_11^batch_normalization_1/batchnorm/ReadVariableOp_23^batch_normalization_1/batchnorm/mul/ReadVariableOp/^batch_normalization_2/batchnorm/ReadVariableOp1^batch_normalization_2/batchnorm/ReadVariableOp_11^batch_normalization_2/batchnorm/ReadVariableOp_23^batch_normalization_2/batchnorm/mul/ReadVariableOp/^batch_normalization_3/batchnorm/ReadVariableOp1^batch_normalization_3/batchnorm/ReadVariableOp_11^batch_normalization_3/batchnorm/ReadVariableOp_23^batch_normalization_3/batchnorm/mul/ReadVariableOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp^p_re_lu/ReadVariableOp^p_re_lu_1/ReadVariableOp^p_re_lu_2/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2`
.batch_normalization/batchnorm/ReadVariableOp_1.batch_normalization/batchnorm/ReadVariableOp_12`
.batch_normalization/batchnorm/ReadVariableOp_2.batch_normalization/batchnorm/ReadVariableOp_22d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2`
.batch_normalization_1/batchnorm/ReadVariableOp.batch_normalization_1/batchnorm/ReadVariableOp2d
0batch_normalization_1/batchnorm/ReadVariableOp_10batch_normalization_1/batchnorm/ReadVariableOp_12d
0batch_normalization_1/batchnorm/ReadVariableOp_20batch_normalization_1/batchnorm/ReadVariableOp_22h
2batch_normalization_1/batchnorm/mul/ReadVariableOp2batch_normalization_1/batchnorm/mul/ReadVariableOp2`
.batch_normalization_2/batchnorm/ReadVariableOp.batch_normalization_2/batchnorm/ReadVariableOp2d
0batch_normalization_2/batchnorm/ReadVariableOp_10batch_normalization_2/batchnorm/ReadVariableOp_12d
0batch_normalization_2/batchnorm/ReadVariableOp_20batch_normalization_2/batchnorm/ReadVariableOp_22h
2batch_normalization_2/batchnorm/mul/ReadVariableOp2batch_normalization_2/batchnorm/mul/ReadVariableOp2`
.batch_normalization_3/batchnorm/ReadVariableOp.batch_normalization_3/batchnorm/ReadVariableOp2d
0batch_normalization_3/batchnorm/ReadVariableOp_10batch_normalization_3/batchnorm/ReadVariableOp_12d
0batch_normalization_3/batchnorm/ReadVariableOp_20batch_normalization_3/batchnorm/ReadVariableOp_22h
2batch_normalization_3/batchnorm/mul/ReadVariableOp2batch_normalization_3/batchnorm/mul/ReadVariableOp2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp20
p_re_lu/ReadVariableOpp_re_lu/ReadVariableOp24
p_re_lu_1/ReadVariableOpp_re_lu_1/ReadVariableOp24
p_re_lu_2/ReadVariableOpp_re_lu_2/ReadVariableOp:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
»

Ш
B__inference_dense_1_layer_call_and_return_conditional_losses_10308

inputs2
matmul_readvariableop_resource:
ђђ.
biasadd_readvariableop_resource:	ђ
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpЈ
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
ђђ*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
MatMulЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpѓ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2	
BiasAddl
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ђ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
┌	
ю
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_10325

inputs&
readvariableop_resource:	ђ
identityѕбReadVariableOpO
ReluReluinputs*
T0*(
_output_shapes
:         ђ2
Reluu
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:ђ*
dtype02
ReadVariableOpO
NegNegReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
NegP
Neg_1Neginputs*
T0*(
_output_shapes
:         ђ2
Neg_1V
Relu_1Relu	Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
Relu_1c
mulMulNeg:y:0Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
mulc
addAddV2Relu:activations:0mul:z:0*
T0*(
_output_shapes
:         ђ2
addc
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:         ђ: 2 
ReadVariableOpReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
Б
╣
*__inference_sequential_layer_call_fn_11468

inputs
unknown:	├
	unknown_0:	├
	unknown_1:	├
	unknown_2:	├
	unknown_3:
├ђ
	unknown_4:	ђ
	unknown_5:	ђ
	unknown_6:	ђ
	unknown_7:	ђ
	unknown_8:	ђ
	unknown_9:	ђ

unknown_10:
ђђ

unknown_11:	ђ

unknown_12:	ђ

unknown_13:	ђ

unknown_14:	ђ

unknown_15:	ђ

unknown_16:	ђ

unknown_17:	ђ@

unknown_18:@

unknown_19:@

unknown_20:@

unknown_21:@

unknown_22:@

unknown_23:@

unknown_24:@

unknown_25:
identityѕбStatefulPartitionedCall¤
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25*'
Tin 
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *=
_read_only_resource_inputs
	
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_104102
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
 	
Ў
A__inference_p_re_lu_layer_call_and_return_conditional_losses_9638

inputs&
readvariableop_resource:	ђ
identityѕбReadVariableOpW
ReluReluinputs*
T0*0
_output_shapes
:                  2
Reluu
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:ђ*
dtype02
ReadVariableOpO
NegNegReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
NegX
Neg_1Neginputs*
T0*0
_output_shapes
:                  2
Neg_1^
Relu_1Relu	Neg_1:y:0*
T0*0
_output_shapes
:                  2
Relu_1c
mulMulNeg:y:0Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
mulc
addAddV2Relu:activations:0mul:z:0*
T0*(
_output_shapes
:         ђ2
addc
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 2 
ReadVariableOpReadVariableOp:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
ш
Ћ
%__inference_dense_layer_call_fn_11653

inputs
unknown:
├ђ
	unknown_0:	ђ
identityѕбStatefulPartitionedCallШ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_102612
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ├: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
ш
b
D__inference_dropout_1_layer_call_and_return_conditional_losses_10296

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:         ђ2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:         ђ2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
ф
c
D__inference_dropout_3_layer_call_and_return_conditional_losses_10497

inputs
identityѕc
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/Consts
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:         @2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape┤
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2
dropout/GreaterEqual/yЙ
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:         @2
dropout/Mul_1e
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:         @2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
┌
л
5__inference_batch_normalization_3_layer_call_fn_12086

inputs
unknown:@
	unknown_0:@
	unknown_1:@
	unknown_2:@
identityѕбStatefulPartitionedCallЪ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *Y
fTRR
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_100902
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:         @: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
п	
џ
B__inference_p_re_lu_layer_call_and_return_conditional_losses_10278

inputs&
readvariableop_resource:	ђ
identityѕбReadVariableOpO
ReluReluinputs*
T0*(
_output_shapes
:         ђ2
Reluu
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:ђ*
dtype02
ReadVariableOpO
NegNegReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
NegP
Neg_1Neginputs*
T0*(
_output_shapes
:         ђ2
Neg_1V
Relu_1Relu	Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
Relu_1c
mulMulNeg:y:0Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
mulc
addAddV2Relu:activations:0mul:z:0*
T0*(
_output_shapes
:         ђ2
addc
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:         ђ: 2 
ReadVariableOpReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
Д
b
)__inference_dropout_1_layer_call_fn_11798

inputs
identityѕбStatefulPartitionedCallЯ
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_1_layer_call_and_return_conditional_losses_105772
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
ф
c
D__inference_dropout_3_layer_call_and_return_conditional_losses_12116

inputs
identityѕc
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/Consts
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:         @2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape┤
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2
dropout/GreaterEqual/yЙ
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:         @2
dropout/Mul_1e
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:         @2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
¤	
Џ
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_12005

inputs%
readvariableop_resource:@
identityѕбReadVariableOpN
ReluReluinputs*
T0*'
_output_shapes
:         @2
Relut
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype02
ReadVariableOpN
NegNegReadVariableOp:value:0*
T0*
_output_shapes
:@2
NegO
Neg_1Neginputs*
T0*'
_output_shapes
:         @2
Neg_1U
Relu_1Relu	Neg_1:y:0*
T0*'
_output_shapes
:         @2
Relu_1b
mulMulNeg:y:0Relu_1:activations:0*
T0*'
_output_shapes
:         @2
mulb
addAddV2Relu:activations:0mul:z:0*
T0*'
_output_shapes
:         @2
addb
IdentityIdentityadd:z:0^NoOp*
T0*'
_output_shapes
:         @2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:         @: 2 
ReadVariableOpReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
Џ
╣
*__inference_sequential_layer_call_fn_11527

inputs
unknown:	├
	unknown_0:	├
	unknown_1:	├
	unknown_2:	├
	unknown_3:
├ђ
	unknown_4:	ђ
	unknown_5:	ђ
	unknown_6:	ђ
	unknown_7:	ђ
	unknown_8:	ђ
	unknown_9:	ђ

unknown_10:
ђђ

unknown_11:	ђ

unknown_12:	ђ

unknown_13:	ђ

unknown_14:	ђ

unknown_15:	ђ

unknown_16:	ђ

unknown_17:	ђ@

unknown_18:@

unknown_19:@

unknown_20:@

unknown_21:@

unknown_22:@

unknown_23:@

unknown_24:@

unknown_25:
identityѕбStatefulPartitionedCallК
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25*'
Tin 
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *5
_read_only_resource_inputs

*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_107542
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
Д
b
)__inference_dropout_2_layer_call_fn_11962

inputs
identityѕбStatefulPartitionedCallЯ
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_105372
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
п
л
5__inference_batch_normalization_3_layer_call_fn_12099

inputs
unknown:@
	unknown_0:@
	unknown_1:@
	unknown_2:@
identityѕбStatefulPartitionedCallЮ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *Y
fTRR
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_101502
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:         @: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
ш
Ћ
'__inference_dense_2_layer_call_fn_11981

inputs
unknown:	ђ@
	unknown_0:@
identityѕбStatefulPartitionedCallэ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_103552
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ђ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
Ы
ћ
'__inference_dense_3_layer_call_fn_12146

inputs
unknown:@
	unknown_0:
identityѕбStatefulPartitionedCallэ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_104032
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
з
`
B__inference_dropout_layer_call_and_return_conditional_losses_10249

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:         ├2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:         ├2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ├:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
ђ

џ
B__inference_p_re_lu_layer_call_and_return_conditional_losses_11665

inputs&
readvariableop_resource:	ђ
identityѕбReadVariableOpW
ReluReluinputs*
T0*0
_output_shapes
:                  2
Reluu
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:ђ*
dtype02
ReadVariableOpO
NegNegReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
NegX
Neg_1Neginputs*
T0*0
_output_shapes
:                  2
Neg_1^
Relu_1Relu	Neg_1:y:0*
T0*0
_output_shapes
:                  2
Relu_1c
mulMulNeg:y:0Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
mulc
addAddV2Relu:activations:0mul:z:0*
T0*(
_output_shapes
:         ђ2
addc
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 2 
ReadVariableOpReadVariableOp:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
у*
ь
P__inference_batch_normalization_2_layer_call_and_return_conditional_losses_11909

inputs6
'assignmovingavg_readvariableop_resource:	ђ8
)assignmovingavg_1_readvariableop_resource:	ђ4
%batchnorm_mul_readvariableop_resource:	ђ0
!batchnorm_readvariableop_resource:	ђ
identityѕбAssignMovingAvgбAssignMovingAvg/ReadVariableOpбAssignMovingAvg_1б AssignMovingAvg_1/ReadVariableOpбbatchnorm/ReadVariableOpбbatchnorm/mul/ReadVariableOpі
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indicesљ
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2
moments/mean}
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	ђ2
moments/StopGradientЦ
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:         ђ2
moments/SquaredDifferenceњ
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices│
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2
moments/varianceЂ
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2
moments/SqueezeЅ
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2
moments/Squeeze_1s
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg/decayЦ
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:ђ*
dtype02 
AssignMovingAvg/ReadVariableOpЎ
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg/subљ
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg/mul┐
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvgw
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg_1/decayФ
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype02"
 AssignMovingAvg_1/ReadVariableOpА
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg_1/subў
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg_1/mul╔
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvg_1g
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЃ
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/mul_1|
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/mul_2Њ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOpѓ
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

IdentityЫ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
█
y
)__inference_p_re_lu_2_layer_call_fn_12012

inputs
unknown:@
identityѕбStatefulPartitionedCallВ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_100422
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
З
»
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_10090

inputs/
!batchnorm_readvariableop_resource:@3
%batchnorm_mul_readvariableop_resource:@1
#batchnorm_readvariableop_1_resource:@1
#batchnorm_readvariableop_2_resource:@
identityѕбbatchnorm/ReadVariableOpбbatchnorm/ReadVariableOp_1бbatchnorm/ReadVariableOp_2бbatchnorm/mul/ReadVariableOpњ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yѕ
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@2
batchnorm/addc
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@2
batchnorm/Rsqrtъ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/mul/ReadVariableOpЁ
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
batchnorm/mulv
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:         @2
batchnorm/mul_1ў
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp_1Ё
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:@2
batchnorm/mul_2ў
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp_2Ѓ
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2
batchnorm/subЁ
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:         @2
batchnorm/add_1n
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:         @2

Identity┬
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:         @: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
Б
b
)__inference_dropout_3_layer_call_fn_12126

inputs
identityѕбStatefulPartitionedCall▀
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_104972
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
БO
Ъ
E__inference_sequential_layer_call_and_return_conditional_losses_10943
input_1(
batch_normalization_10873:	├(
batch_normalization_10875:	├(
batch_normalization_10877:	├(
batch_normalization_10879:	├
dense_10883:
├ђ
dense_10885:	ђ
p_re_lu_10888:	ђ*
batch_normalization_1_10891:	ђ*
batch_normalization_1_10893:	ђ*
batch_normalization_1_10895:	ђ*
batch_normalization_1_10897:	ђ!
dense_1_10901:
ђђ
dense_1_10903:	ђ
p_re_lu_1_10906:	ђ*
batch_normalization_2_10909:	ђ*
batch_normalization_2_10911:	ђ*
batch_normalization_2_10913:	ђ*
batch_normalization_2_10915:	ђ 
dense_2_10919:	ђ@
dense_2_10921:@
p_re_lu_2_10924:@)
batch_normalization_3_10927:@)
batch_normalization_3_10929:@)
batch_normalization_3_10931:@)
batch_normalization_3_10933:@
dense_3_10937:@
dense_3_10939:
identityѕб+batch_normalization/StatefulPartitionedCallб-batch_normalization_1/StatefulPartitionedCallб-batch_normalization_2/StatefulPartitionedCallб-batch_normalization_3/StatefulPartitionedCallбdense/StatefulPartitionedCallбdense_1/StatefulPartitionedCallбdense_2/StatefulPartitionedCallбdense_3/StatefulPartitionedCallбp_re_lu/StatefulPartitionedCallб!p_re_lu_1/StatefulPartitionedCallб!p_re_lu_2/StatefulPartitionedCallѕ
+batch_normalization/StatefulPartitionedCallStatefulPartitionedCallinput_1batch_normalization_10873batch_normalization_10875batch_normalization_10877batch_normalization_10879*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *V
fQRO
M__inference_batch_normalization_layer_call_and_return_conditional_losses_94842-
+batch_normalization/StatefulPartitionedCallё
dropout/PartitionedCallPartitionedCall4batch_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dropout_layer_call_and_return_conditional_losses_102492
dropout/PartitionedCallб
dense/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0dense_10883dense_10885*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_102612
dense/StatefulPartitionedCallА
p_re_lu/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0p_re_lu_10888*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_p_re_lu_layer_call_and_return_conditional_losses_102782!
p_re_lu/StatefulPartitionedCallи
-batch_normalization_1/StatefulPartitionedCallStatefulPartitionedCall(p_re_lu/StatefulPartitionedCall:output:0batch_normalization_1_10891batch_normalization_1_10893batch_normalization_1_10895batch_normalization_1_10897*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_1_layer_call_and_return_conditional_losses_96862/
-batch_normalization_1/StatefulPartitionedCallї
dropout_1/PartitionedCallPartitionedCall6batch_normalization_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_1_layer_call_and_return_conditional_losses_102962
dropout_1/PartitionedCall«
dense_1/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense_1_10901dense_1_10903*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_103082!
dense_1/StatefulPartitionedCallФ
!p_re_lu_1/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0p_re_lu_1_10906*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_103252#
!p_re_lu_1/StatefulPartitionedCall╣
-batch_normalization_2/StatefulPartitionedCallStatefulPartitionedCall*p_re_lu_1/StatefulPartitionedCall:output:0batch_normalization_2_10909batch_normalization_2_10911batch_normalization_2_10913batch_normalization_2_10915*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_2_layer_call_and_return_conditional_losses_98882/
-batch_normalization_2/StatefulPartitionedCallї
dropout_2/PartitionedCallPartitionedCall6batch_normalization_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_103432
dropout_2/PartitionedCallГ
dense_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense_2_10919dense_2_10921*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_103552!
dense_2/StatefulPartitionedCallф
!p_re_lu_2/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0p_re_lu_2_10924*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_103722#
!p_re_lu_2/StatefulPartitionedCall╣
-batch_normalization_3/StatefulPartitionedCallStatefulPartitionedCall*p_re_lu_2/StatefulPartitionedCall:output:0batch_normalization_3_10927batch_normalization_3_10929batch_normalization_3_10931batch_normalization_3_10933*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *Y
fTRR
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_100902/
-batch_normalization_3/StatefulPartitionedCallІ
dropout_3/PartitionedCallPartitionedCall6batch_normalization_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_103902
dropout_3/PartitionedCallГ
dense_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0dense_3_10937dense_3_10939*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_104032!
dense_3/StatefulPartitionedCallЃ
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

IdentityЧ
NoOpNoOp,^batch_normalization/StatefulPartitionedCall.^batch_normalization_1/StatefulPartitionedCall.^batch_normalization_2/StatefulPartitionedCall.^batch_normalization_3/StatefulPartitionedCall^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall ^p_re_lu/StatefulPartitionedCall"^p_re_lu_1/StatefulPartitionedCall"^p_re_lu_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 2Z
+batch_normalization/StatefulPartitionedCall+batch_normalization/StatefulPartitionedCall2^
-batch_normalization_1/StatefulPartitionedCall-batch_normalization_1/StatefulPartitionedCall2^
-batch_normalization_2/StatefulPartitionedCall-batch_normalization_2/StatefulPartitionedCall2^
-batch_normalization_3/StatefulPartitionedCall-batch_normalization_3/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
p_re_lu/StatefulPartitionedCallp_re_lu/StatefulPartitionedCall2F
!p_re_lu_1/StatefulPartitionedCall!p_re_lu_1/StatefulPartitionedCall2F
!p_re_lu_2/StatefulPartitionedCall!p_re_lu_2/StatefulPartitionedCall:Q M
(
_output_shapes
:         ├
!
_user_specified_name	input_1
┴
C
'__inference_dropout_layer_call_fn_11629

inputs
identityк
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dropout_layer_call_and_return_conditional_losses_102492
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:         ├2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ├:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
┌	
ю
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_11841

inputs&
readvariableop_resource:	ђ
identityѕбReadVariableOpO
ReluReluinputs*
T0*(
_output_shapes
:         ђ2
Reluu
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:ђ*
dtype02
ReadVariableOpO
NegNegReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
NegP
Neg_1Neginputs*
T0*(
_output_shapes
:         ђ2
Neg_1V
Relu_1Relu	Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
Relu_1c
mulMulNeg:y:0Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
mulc
addAddV2Relu:activations:0mul:z:0*
T0*(
_output_shapes
:         ђ2
addc
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:         ђ: 2 
ReadVariableOpReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
љ
з
B__inference_dense_3_layer_call_and_return_conditional_losses_12137

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpЇ
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulї
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpЂ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAddd
SoftplusSoftplusBiasAdd:output:0*
T0*'
_output_shapes
:         2

Softplusq
IdentityIdentitySoftplus:activations:0^NoOp*
T0*'
_output_shapes
:         2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
┴
E
)__inference_dropout_3_layer_call_fn_12121

inputs
identityК
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_103902
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:         @2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
ш
b
D__inference_dropout_1_layer_call_and_return_conditional_losses_11776

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:         ђ2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:         ђ2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
П
м
3__inference_batch_normalization_layer_call_fn_11594

inputs
unknown:	├
	unknown_0:	├
	unknown_1:	├
	unknown_2:	├
identityѕбStatefulPartitionedCallЮ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *V
fQRO
M__inference_batch_normalization_layer_call_and_return_conditional_losses_94842
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ├2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ├: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
ѓ

ю
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_11829

inputs&
readvariableop_resource:	ђ
identityѕбReadVariableOpW
ReluReluinputs*
T0*0
_output_shapes
:                  2
Reluu
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:ђ*
dtype02
ReadVariableOpO
NegNegReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
NegX
Neg_1Neginputs*
T0*0
_output_shapes
:                  2
Neg_1^
Relu_1Relu	Neg_1:y:0*
T0*0
_output_shapes
:                  2
Relu_1c
mulMulNeg:y:0Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
mulc
addAddV2Relu:activations:0mul:z:0*
T0*(
_output_shapes
:         ђ2
addc
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 2 
ReadVariableOpReadVariableOp:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
╬
z
)__inference_p_re_lu_1_layer_call_fn_11855

inputs
unknown:	ђ
identityѕбStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_103252
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:         ђ: 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
Б
`
'__inference_dropout_layer_call_fn_11634

inputs
identityѕбStatefulPartitionedCallя
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dropout_layer_call_and_return_conditional_losses_106172
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ├2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ├22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
│
c
D__inference_dropout_2_layer_call_and_return_conditional_losses_10537

inputs
identityѕc
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:         ђ2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shapeх
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:         ђ*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2
dropout/GreaterEqual/y┐
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ђ2
dropout/GreaterEqualђ
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ђ2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:         ђ2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:         ђ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
р
н
5__inference_batch_normalization_1_layer_call_fn_11758

inputs
unknown:	ђ
	unknown_0:	ђ
	unknown_1:	ђ
	unknown_2:	ђ
identityѕбStatefulPartitionedCallЪ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_1_layer_call_and_return_conditional_losses_96862
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
▀
н
5__inference_batch_normalization_2_layer_call_fn_11935

inputs
unknown:	ђ
	unknown_0:	ђ
	unknown_1:	ђ
	unknown_2:	ђ
identityѕбStatefulPartitionedCallЮ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_2_layer_call_and_return_conditional_losses_99482
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
╩
x
'__inference_p_re_lu_layer_call_fn_11691

inputs
unknown:	ђ
identityѕбStatefulPartitionedCallв
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_p_re_lu_layer_call_and_return_conditional_losses_102782
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:         ђ: 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
»

Ш
B__inference_dense_1_layer_call_and_return_conditional_losses_11808

inputs2
matmul_readvariableop_resource:
ђђ.
biasadd_readvariableop_resource:	ђ
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpЈ
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
ђђ*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
MatMulЇ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
BiasAdd/ReadVariableOpѓ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2	
BiasAddl
IdentityIdentityBiasAdd:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ђ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
┼
E
)__inference_dropout_2_layer_call_fn_11957

inputs
identity╚
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_103432
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:         ђ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
С*
Ж
M__inference_batch_normalization_layer_call_and_return_conditional_losses_9544

inputs6
'assignmovingavg_readvariableop_resource:	├8
)assignmovingavg_1_readvariableop_resource:	├4
%batchnorm_mul_readvariableop_resource:	├0
!batchnorm_readvariableop_resource:	├
identityѕбAssignMovingAvgбAssignMovingAvg/ReadVariableOpбAssignMovingAvg_1б AssignMovingAvg_1/ReadVariableOpбbatchnorm/ReadVariableOpбbatchnorm/mul/ReadVariableOpі
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indicesљ
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	├*
	keep_dims(2
moments/mean}
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	├2
moments/StopGradientЦ
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:         ├2
moments/SquaredDifferenceњ
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices│
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	├*
	keep_dims(2
moments/varianceЂ
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:├*
squeeze_dims
 2
moments/SqueezeЅ
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:├*
squeeze_dims
 2
moments/Squeeze_1s
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg/decayЦ
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:├*
dtype02 
AssignMovingAvg/ReadVariableOpЎ
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:├2
AssignMovingAvg/subљ
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:├2
AssignMovingAvg/mul┐
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvgw
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg_1/decayФ
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:├*
dtype02"
 AssignMovingAvg_1/ReadVariableOpА
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:├2
AssignMovingAvg_1/subў
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:├2
AssignMovingAvg_1/mul╔
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvg_1g
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЃ
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:├2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:├2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:├*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:├2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ├2
batchnorm/mul_1|
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:├2
batchnorm/mul_2Њ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:├*
dtype02
batchnorm/ReadVariableOpѓ
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:├2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ├2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ├2

IdentityЫ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ├: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
Ё
▓
O__inference_batch_normalization_1_layer_call_and_return_conditional_losses_9686

inputs0
!batchnorm_readvariableop_resource:	ђ4
%batchnorm_mul_readvariableop_resource:	ђ2
#batchnorm_readvariableop_1_resource:	ђ2
#batchnorm_readvariableop_2_resource:	ђ
identityѕбbatchnorm/ReadVariableOpбbatchnorm/ReadVariableOp_1бbatchnorm/ReadVariableOp_2бbatchnorm/mul/ReadVariableOpЊ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЅ
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/mul_1Ў
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOp_1є
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/mul_2Ў
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOp_2ё
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity┬
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
е

З
B__inference_dense_2_layer_call_and_return_conditional_losses_11972

inputs1
matmul_readvariableop_resource:	ђ@-
biasadd_readvariableop_resource:@
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpј
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ђ@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2
MatMulї
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOpЂ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:         @2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ђ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
п	
џ
B__inference_p_re_lu_layer_call_and_return_conditional_losses_11677

inputs&
readvariableop_resource:	ђ
identityѕбReadVariableOpO
ReluReluinputs*
T0*(
_output_shapes
:         ђ2
Reluu
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:ђ*
dtype02
ReadVariableOpO
NegNegReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
NegP
Neg_1Neginputs*
T0*(
_output_shapes
:         ђ2
Neg_1V
Relu_1Relu	Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
Relu_1c
mulMulNeg:y:0Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
mulc
addAddV2Relu:activations:0mul:z:0*
T0*(
_output_shapes
:         ђ2
addc
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*)
_input_shapes
:         ђ: 2 
ReadVariableOpReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
Ё
▓
O__inference_batch_normalization_2_layer_call_and_return_conditional_losses_9888

inputs0
!batchnorm_readvariableop_resource:	ђ4
%batchnorm_mul_readvariableop_resource:	ђ2
#batchnorm_readvariableop_1_resource:	ђ2
#batchnorm_readvariableop_2_resource:	ђ
identityѕбbatchnorm/ReadVariableOpбbatchnorm/ReadVariableOp_1бbatchnorm/ReadVariableOp_2бbatchnorm/mul/ReadVariableOpЊ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЅ
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/mul_1Ў
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOp_1є
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/mul_2Ў
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOp_2ё
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity┬
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
йU
Г
E__inference_sequential_layer_call_and_return_conditional_losses_11016
input_1(
batch_normalization_10946:	├(
batch_normalization_10948:	├(
batch_normalization_10950:	├(
batch_normalization_10952:	├
dense_10956:
├ђ
dense_10958:	ђ
p_re_lu_10961:	ђ*
batch_normalization_1_10964:	ђ*
batch_normalization_1_10966:	ђ*
batch_normalization_1_10968:	ђ*
batch_normalization_1_10970:	ђ!
dense_1_10974:
ђђ
dense_1_10976:	ђ
p_re_lu_1_10979:	ђ*
batch_normalization_2_10982:	ђ*
batch_normalization_2_10984:	ђ*
batch_normalization_2_10986:	ђ*
batch_normalization_2_10988:	ђ 
dense_2_10992:	ђ@
dense_2_10994:@
p_re_lu_2_10997:@)
batch_normalization_3_11000:@)
batch_normalization_3_11002:@)
batch_normalization_3_11004:@)
batch_normalization_3_11006:@
dense_3_11010:@
dense_3_11012:
identityѕб+batch_normalization/StatefulPartitionedCallб-batch_normalization_1/StatefulPartitionedCallб-batch_normalization_2/StatefulPartitionedCallб-batch_normalization_3/StatefulPartitionedCallбdense/StatefulPartitionedCallбdense_1/StatefulPartitionedCallбdense_2/StatefulPartitionedCallбdense_3/StatefulPartitionedCallбdropout/StatefulPartitionedCallб!dropout_1/StatefulPartitionedCallб!dropout_2/StatefulPartitionedCallб!dropout_3/StatefulPartitionedCallбp_re_lu/StatefulPartitionedCallб!p_re_lu_1/StatefulPartitionedCallб!p_re_lu_2/StatefulPartitionedCallє
+batch_normalization/StatefulPartitionedCallStatefulPartitionedCallinput_1batch_normalization_10946batch_normalization_10948batch_normalization_10950batch_normalization_10952*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *V
fQRO
M__inference_batch_normalization_layer_call_and_return_conditional_losses_95442-
+batch_normalization/StatefulPartitionedCallю
dropout/StatefulPartitionedCallStatefulPartitionedCall4batch_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dropout_layer_call_and_return_conditional_losses_106172!
dropout/StatefulPartitionedCallф
dense/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0dense_10956dense_10958*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_102612
dense/StatefulPartitionedCallА
p_re_lu/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0p_re_lu_10961*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_p_re_lu_layer_call_and_return_conditional_losses_102782!
p_re_lu/StatefulPartitionedCallх
-batch_normalization_1/StatefulPartitionedCallStatefulPartitionedCall(p_re_lu/StatefulPartitionedCall:output:0batch_normalization_1_10964batch_normalization_1_10966batch_normalization_1_10968batch_normalization_1_10970*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_1_layer_call_and_return_conditional_losses_97462/
-batch_normalization_1/StatefulPartitionedCallк
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall6batch_normalization_1/StatefulPartitionedCall:output:0 ^dropout/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_1_layer_call_and_return_conditional_losses_105772#
!dropout_1/StatefulPartitionedCallХ
dense_1/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense_1_10974dense_1_10976*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_103082!
dense_1/StatefulPartitionedCallФ
!p_re_lu_1/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0p_re_lu_1_10979*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_103252#
!p_re_lu_1/StatefulPartitionedCallи
-batch_normalization_2/StatefulPartitionedCallStatefulPartitionedCall*p_re_lu_1/StatefulPartitionedCall:output:0batch_normalization_2_10982batch_normalization_2_10984batch_normalization_2_10986batch_normalization_2_10988*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_2_layer_call_and_return_conditional_losses_99482/
-batch_normalization_2/StatefulPartitionedCall╚
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall6batch_normalization_2/StatefulPartitionedCall:output:0"^dropout_1/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_105372#
!dropout_2/StatefulPartitionedCallх
dense_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense_2_10992dense_2_10994*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_103552!
dense_2/StatefulPartitionedCallф
!p_re_lu_2/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0p_re_lu_2_10997*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_103722#
!p_re_lu_2/StatefulPartitionedCallи
-batch_normalization_3/StatefulPartitionedCallStatefulPartitionedCall*p_re_lu_2/StatefulPartitionedCall:output:0batch_normalization_3_11000batch_normalization_3_11002batch_normalization_3_11004batch_normalization_3_11006*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *Y
fTRR
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_101502/
-batch_normalization_3/StatefulPartitionedCallК
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall6batch_normalization_3/StatefulPartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_104972#
!dropout_3/StatefulPartitionedCallх
dense_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0dense_3_11010dense_3_11012*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_104032!
dense_3/StatefulPartitionedCallЃ
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

Identityі
NoOpNoOp,^batch_normalization/StatefulPartitionedCall.^batch_normalization_1/StatefulPartitionedCall.^batch_normalization_2/StatefulPartitionedCall.^batch_normalization_3/StatefulPartitionedCall^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall ^dropout/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall ^p_re_lu/StatefulPartitionedCall"^p_re_lu_1/StatefulPartitionedCall"^p_re_lu_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 2Z
+batch_normalization/StatefulPartitionedCall+batch_normalization/StatefulPartitionedCall2^
-batch_normalization_1/StatefulPartitionedCall-batch_normalization_1/StatefulPartitionedCall2^
-batch_normalization_2/StatefulPartitionedCall-batch_normalization_2/StatefulPartitionedCall2^
-batch_normalization_3/StatefulPartitionedCall-batch_normalization_3/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall2B
p_re_lu/StatefulPartitionedCallp_re_lu/StatefulPartitionedCall2F
!p_re_lu_1/StatefulPartitionedCall!p_re_lu_1/StatefulPartitionedCall2F
!p_re_lu_2/StatefulPartitionedCall!p_re_lu_2/StatefulPartitionedCall:Q M
(
_output_shapes
:         ├
!
_user_specified_name	input_1
╦*
ж
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_10150

inputs5
'assignmovingavg_readvariableop_resource:@7
)assignmovingavg_1_readvariableop_resource:@3
%batchnorm_mul_readvariableop_resource:@/
!batchnorm_readvariableop_resource:@
identityѕбAssignMovingAvgбAssignMovingAvg/ReadVariableOpбAssignMovingAvg_1б AssignMovingAvg_1/ReadVariableOpбbatchnorm/ReadVariableOpбbatchnorm/mul/ReadVariableOpі
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indicesЈ
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2
moments/mean|
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:@2
moments/StopGradientц
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:         @2
moments/SquaredDifferenceњ
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices▓
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2
moments/varianceђ
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2
moments/Squeezeѕ
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2
moments/Squeeze_1s
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg/decayц
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:@*
dtype02 
AssignMovingAvg/ReadVariableOpў
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:@2
AssignMovingAvg/subЈ
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:@2
AssignMovingAvg/mul┐
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvgw
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg_1/decayф
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:@*
dtype02"
 AssignMovingAvg_1/ReadVariableOpа
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:@2
AssignMovingAvg_1/subЌ
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:@2
AssignMovingAvg_1/mul╔
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvg_1g
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yѓ
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@2
batchnorm/addc
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@2
batchnorm/Rsqrtъ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/mul/ReadVariableOpЁ
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
batchnorm/mulv
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:         @2
batchnorm/mul_1{
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:@2
batchnorm/mul_2њ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOpЂ
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2
batchnorm/subЁ
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:         @2
batchnorm/add_1n
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:         @2

IdentityЫ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:         @: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
е

З
B__inference_dense_2_layer_call_and_return_conditional_losses_10355

inputs1
matmul_readvariableop_resource:	ђ@-
biasadd_readvariableop_resource:@
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpј
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	ђ@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2
MatMulї
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOpЂ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2	
BiasAddk
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:         @2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ђ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
љ
з
B__inference_dense_3_layer_call_and_return_conditional_losses_10403

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:
identityѕбBiasAdd/ReadVariableOpбMatMul/ReadVariableOpЇ
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
MatMulї
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpЂ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2	
BiasAddd
SoftplusSoftplusBiasAdd:output:0*
T0*'
_output_shapes
:         2

Softplusq
IdentityIdentitySoftplus:activations:0^NoOp*
T0*'
_output_shapes
:         2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
┘
x
'__inference_p_re_lu_layer_call_fn_11684

inputs
unknown:	ђ
identityѕбStatefulPartitionedCallЖ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *J
fERC
A__inference_p_re_lu_layer_call_and_return_conditional_losses_96382
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
¤	
Џ
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_10372

inputs%
readvariableop_resource:@
identityѕбReadVariableOpN
ReluReluinputs*
T0*'
_output_shapes
:         @2
Relut
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype02
ReadVariableOpN
NegNegReadVariableOp:value:0*
T0*
_output_shapes
:@2
NegO
Neg_1Neginputs*
T0*'
_output_shapes
:         @2
Neg_1U
Relu_1Relu	Neg_1:y:0*
T0*'
_output_shapes
:         @2
Relu_1b
mulMulNeg:y:0Relu_1:activations:0*
T0*'
_output_shapes
:         @2
mulb
addAddV2Relu:activations:0mul:z:0*
T0*'
_output_shapes
:         @2
addb
IdentityIdentityadd:z:0^NoOp*
T0*'
_output_shapes
:         @2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:         @: 2 
ReadVariableOpReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
┼
E
)__inference_dropout_1_layer_call_fn_11793

inputs
identity╚
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_1_layer_call_and_return_conditional_losses_102962
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:         ђ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
ъ
║
*__inference_sequential_layer_call_fn_10870
input_1
unknown:	├
	unknown_0:	├
	unknown_1:	├
	unknown_2:	├
	unknown_3:
├ђ
	unknown_4:	ђ
	unknown_5:	ђ
	unknown_6:	ђ
	unknown_7:	ђ
	unknown_8:	ђ
	unknown_9:	ђ

unknown_10:
ђђ

unknown_11:	ђ

unknown_12:	ђ

unknown_13:	ђ

unknown_14:	ђ

unknown_15:	ђ

unknown_16:	ђ

unknown_17:	ђ@

unknown_18:@

unknown_19:@

unknown_20:@

unknown_21:@

unknown_22:@

unknown_23:@

unknown_24:@

unknown_25:
identityѕбStatefulPartitionedCall╚
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25*'
Tin 
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *5
_read_only_resource_inputs

*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_107542
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:         ├
!
_user_specified_name	input_1
▒
a
B__inference_dropout_layer_call_and_return_conditional_losses_11624

inputs
identityѕc
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:         ├2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shapeх
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:         ├*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2
dropout/GreaterEqual/y┐
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ├2
dropout/GreaterEqualђ
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ├2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:         ├2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:         ├2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ├:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
р
н
5__inference_batch_normalization_2_layer_call_fn_11922

inputs
unknown:	ђ
	unknown_0:	ђ
	unknown_1:	ђ
	unknown_2:	ђ
identityѕбStatefulPartitionedCallЪ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_2_layer_call_and_return_conditional_losses_98882
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
█
м
3__inference_batch_normalization_layer_call_fn_11607

inputs
unknown:	├
	unknown_0:	├
	unknown_1:	├
	unknown_2:	├
identityѕбStatefulPartitionedCallЏ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *V
fQRO
M__inference_batch_normalization_layer_call_and_return_conditional_losses_95442
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ├2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ├: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
│
c
D__inference_dropout_2_layer_call_and_return_conditional_losses_11952

inputs
identityѕc
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:         ђ2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shapeх
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:         ђ*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2
dropout/GreaterEqual/y┐
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ђ2
dropout/GreaterEqualђ
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ђ2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:         ђ2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:         ђ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
т*
в
N__inference_batch_normalization_layer_call_and_return_conditional_losses_11581

inputs6
'assignmovingavg_readvariableop_resource:	├8
)assignmovingavg_1_readvariableop_resource:	├4
%batchnorm_mul_readvariableop_resource:	├0
!batchnorm_readvariableop_resource:	├
identityѕбAssignMovingAvgбAssignMovingAvg/ReadVariableOpбAssignMovingAvg_1б AssignMovingAvg_1/ReadVariableOpбbatchnorm/ReadVariableOpбbatchnorm/mul/ReadVariableOpі
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indicesљ
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	├*
	keep_dims(2
moments/mean}
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	├2
moments/StopGradientЦ
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:         ├2
moments/SquaredDifferenceњ
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices│
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	├*
	keep_dims(2
moments/varianceЂ
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:├*
squeeze_dims
 2
moments/SqueezeЅ
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:├*
squeeze_dims
 2
moments/Squeeze_1s
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg/decayЦ
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:├*
dtype02 
AssignMovingAvg/ReadVariableOpЎ
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:├2
AssignMovingAvg/subљ
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:├2
AssignMovingAvg/mul┐
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvgw
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg_1/decayФ
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:├*
dtype02"
 AssignMovingAvg_1/ReadVariableOpА
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:├2
AssignMovingAvg_1/subў
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:├2
AssignMovingAvg_1/mul╔
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvg_1g
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЃ
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:├2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:├2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:├*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:├2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ├2
batchnorm/mul_1|
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:├2
batchnorm/mul_2Њ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:├*
dtype02
batchnorm/ReadVariableOpѓ
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:├2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ├2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ├2

IdentityЫ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ├: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
╦*
ж
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_12073

inputs5
'assignmovingavg_readvariableop_resource:@7
)assignmovingavg_1_readvariableop_resource:@3
%batchnorm_mul_readvariableop_resource:@/
!batchnorm_readvariableop_resource:@
identityѕбAssignMovingAvgбAssignMovingAvg/ReadVariableOpбAssignMovingAvg_1б AssignMovingAvg_1/ReadVariableOpбbatchnorm/ReadVariableOpбbatchnorm/mul/ReadVariableOpі
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indicesЈ
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2
moments/mean|
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:@2
moments/StopGradientц
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:         @2
moments/SquaredDifferenceњ
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices▓
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2
moments/varianceђ
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2
moments/Squeezeѕ
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2
moments/Squeeze_1s
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg/decayц
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
:@*
dtype02 
AssignMovingAvg/ReadVariableOpў
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
:@2
AssignMovingAvg/subЈ
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
:@2
AssignMovingAvg/mul┐
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvgw
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg_1/decayф
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
:@*
dtype02"
 AssignMovingAvg_1/ReadVariableOpа
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
:@2
AssignMovingAvg_1/subЌ
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
:@2
AssignMovingAvg_1/mul╔
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvg_1g
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yѓ
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@2
batchnorm/addc
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@2
batchnorm/Rsqrtъ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/mul/ReadVariableOpЁ
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
batchnorm/mulv
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:         @2
batchnorm/mul_1{
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:@2
batchnorm/mul_2њ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOpЂ
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2
batchnorm/subЁ
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:         @2
batchnorm/add_1n
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:         @2

IdentityЫ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:         @: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
╔
y
)__inference_p_re_lu_2_layer_call_fn_12019

inputs
unknown:@
identityѕбStatefulPartitionedCallВ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_103722
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*(
_input_shapes
:         @: 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
є
│
P__inference_batch_normalization_1_layer_call_and_return_conditional_losses_11711

inputs0
!batchnorm_readvariableop_resource:	ђ4
%batchnorm_mul_readvariableop_resource:	ђ2
#batchnorm_readvariableop_1_resource:	ђ2
#batchnorm_readvariableop_2_resource:	ђ
identityѕбbatchnorm/ReadVariableOpбbatchnorm/ReadVariableOp_1бbatchnorm/ReadVariableOp_2бbatchnorm/mul/ReadVariableOpЊ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЅ
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/mul_1Ў
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOp_1є
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/mul_2Ў
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOp_2ё
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity┬
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
оп
Ш
__inference__wrapped_model_9460
input_1O
@sequential_batch_normalization_batchnorm_readvariableop_resource:	├S
Dsequential_batch_normalization_batchnorm_mul_readvariableop_resource:	├Q
Bsequential_batch_normalization_batchnorm_readvariableop_1_resource:	├Q
Bsequential_batch_normalization_batchnorm_readvariableop_2_resource:	├C
/sequential_dense_matmul_readvariableop_resource:
├ђ?
0sequential_dense_biasadd_readvariableop_resource:	ђ9
*sequential_p_re_lu_readvariableop_resource:	ђQ
Bsequential_batch_normalization_1_batchnorm_readvariableop_resource:	ђU
Fsequential_batch_normalization_1_batchnorm_mul_readvariableop_resource:	ђS
Dsequential_batch_normalization_1_batchnorm_readvariableop_1_resource:	ђS
Dsequential_batch_normalization_1_batchnorm_readvariableop_2_resource:	ђE
1sequential_dense_1_matmul_readvariableop_resource:
ђђA
2sequential_dense_1_biasadd_readvariableop_resource:	ђ;
,sequential_p_re_lu_1_readvariableop_resource:	ђQ
Bsequential_batch_normalization_2_batchnorm_readvariableop_resource:	ђU
Fsequential_batch_normalization_2_batchnorm_mul_readvariableop_resource:	ђS
Dsequential_batch_normalization_2_batchnorm_readvariableop_1_resource:	ђS
Dsequential_batch_normalization_2_batchnorm_readvariableop_2_resource:	ђD
1sequential_dense_2_matmul_readvariableop_resource:	ђ@@
2sequential_dense_2_biasadd_readvariableop_resource:@:
,sequential_p_re_lu_2_readvariableop_resource:@P
Bsequential_batch_normalization_3_batchnorm_readvariableop_resource:@T
Fsequential_batch_normalization_3_batchnorm_mul_readvariableop_resource:@R
Dsequential_batch_normalization_3_batchnorm_readvariableop_1_resource:@R
Dsequential_batch_normalization_3_batchnorm_readvariableop_2_resource:@C
1sequential_dense_3_matmul_readvariableop_resource:@@
2sequential_dense_3_biasadd_readvariableop_resource:
identityѕб7sequential/batch_normalization/batchnorm/ReadVariableOpб9sequential/batch_normalization/batchnorm/ReadVariableOp_1б9sequential/batch_normalization/batchnorm/ReadVariableOp_2б;sequential/batch_normalization/batchnorm/mul/ReadVariableOpб9sequential/batch_normalization_1/batchnorm/ReadVariableOpб;sequential/batch_normalization_1/batchnorm/ReadVariableOp_1б;sequential/batch_normalization_1/batchnorm/ReadVariableOp_2б=sequential/batch_normalization_1/batchnorm/mul/ReadVariableOpб9sequential/batch_normalization_2/batchnorm/ReadVariableOpб;sequential/batch_normalization_2/batchnorm/ReadVariableOp_1б;sequential/batch_normalization_2/batchnorm/ReadVariableOp_2б=sequential/batch_normalization_2/batchnorm/mul/ReadVariableOpб9sequential/batch_normalization_3/batchnorm/ReadVariableOpб;sequential/batch_normalization_3/batchnorm/ReadVariableOp_1б;sequential/batch_normalization_3/batchnorm/ReadVariableOp_2б=sequential/batch_normalization_3/batchnorm/mul/ReadVariableOpб'sequential/dense/BiasAdd/ReadVariableOpб&sequential/dense/MatMul/ReadVariableOpб)sequential/dense_1/BiasAdd/ReadVariableOpб(sequential/dense_1/MatMul/ReadVariableOpб)sequential/dense_2/BiasAdd/ReadVariableOpб(sequential/dense_2/MatMul/ReadVariableOpб)sequential/dense_3/BiasAdd/ReadVariableOpб(sequential/dense_3/MatMul/ReadVariableOpб!sequential/p_re_lu/ReadVariableOpб#sequential/p_re_lu_1/ReadVariableOpб#sequential/p_re_lu_2/ReadVariableOp­
7sequential/batch_normalization/batchnorm/ReadVariableOpReadVariableOp@sequential_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes	
:├*
dtype029
7sequential/batch_normalization/batchnorm/ReadVariableOpЦ
.sequential/batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:20
.sequential/batch_normalization/batchnorm/add/yЁ
,sequential/batch_normalization/batchnorm/addAddV2?sequential/batch_normalization/batchnorm/ReadVariableOp:value:07sequential/batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes	
:├2.
,sequential/batch_normalization/batchnorm/add┴
.sequential/batch_normalization/batchnorm/RsqrtRsqrt0sequential/batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes	
:├20
.sequential/batch_normalization/batchnorm/RsqrtЧ
;sequential/batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOpDsequential_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes	
:├*
dtype02=
;sequential/batch_normalization/batchnorm/mul/ReadVariableOpѓ
,sequential/batch_normalization/batchnorm/mulMul2sequential/batch_normalization/batchnorm/Rsqrt:y:0Csequential/batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:├2.
,sequential/batch_normalization/batchnorm/mulН
.sequential/batch_normalization/batchnorm/mul_1Mulinput_10sequential/batch_normalization/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ├20
.sequential/batch_normalization/batchnorm/mul_1Ш
9sequential/batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOpBsequential_batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes	
:├*
dtype02;
9sequential/batch_normalization/batchnorm/ReadVariableOp_1ѓ
.sequential/batch_normalization/batchnorm/mul_2MulAsequential/batch_normalization/batchnorm/ReadVariableOp_1:value:00sequential/batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes	
:├20
.sequential/batch_normalization/batchnorm/mul_2Ш
9sequential/batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOpBsequential_batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes	
:├*
dtype02;
9sequential/batch_normalization/batchnorm/ReadVariableOp_2ђ
,sequential/batch_normalization/batchnorm/subSubAsequential/batch_normalization/batchnorm/ReadVariableOp_2:value:02sequential/batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:├2.
,sequential/batch_normalization/batchnorm/subѓ
.sequential/batch_normalization/batchnorm/add_1AddV22sequential/batch_normalization/batchnorm/mul_1:z:00sequential/batch_normalization/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ├20
.sequential/batch_normalization/batchnorm/add_1Г
sequential/dropout/IdentityIdentity2sequential/batch_normalization/batchnorm/add_1:z:0*
T0*(
_output_shapes
:         ├2
sequential/dropout/Identity┬
&sequential/dense/MatMul/ReadVariableOpReadVariableOp/sequential_dense_matmul_readvariableop_resource* 
_output_shapes
:
├ђ*
dtype02(
&sequential/dense/MatMul/ReadVariableOp┼
sequential/dense/MatMulMatMul$sequential/dropout/Identity:output:0.sequential/dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
sequential/dense/MatMul└
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02)
'sequential/dense/BiasAdd/ReadVariableOpк
sequential/dense/BiasAddBiasAdd!sequential/dense/MatMul:product:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
sequential/dense/BiasAddљ
sequential/p_re_lu/ReluRelu!sequential/dense/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu/Relu«
!sequential/p_re_lu/ReadVariableOpReadVariableOp*sequential_p_re_lu_readvariableop_resource*
_output_shapes	
:ђ*
dtype02#
!sequential/p_re_lu/ReadVariableOpѕ
sequential/p_re_lu/NegNeg)sequential/p_re_lu/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
sequential/p_re_lu/NegЉ
sequential/p_re_lu/Neg_1Neg!sequential/dense/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu/Neg_1Ј
sequential/p_re_lu/Relu_1Relusequential/p_re_lu/Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu/Relu_1»
sequential/p_re_lu/mulMulsequential/p_re_lu/Neg:y:0'sequential/p_re_lu/Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu/mul»
sequential/p_re_lu/addAddV2%sequential/p_re_lu/Relu:activations:0sequential/p_re_lu/mul:z:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu/addШ
9sequential/batch_normalization_1/batchnorm/ReadVariableOpReadVariableOpBsequential_batch_normalization_1_batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02;
9sequential/batch_normalization_1/batchnorm/ReadVariableOpЕ
0sequential/batch_normalization_1/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:22
0sequential/batch_normalization_1/batchnorm/add/yЇ
.sequential/batch_normalization_1/batchnorm/addAddV2Asequential/batch_normalization_1/batchnorm/ReadVariableOp:value:09sequential/batch_normalization_1/batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ20
.sequential/batch_normalization_1/batchnorm/addК
0sequential/batch_normalization_1/batchnorm/RsqrtRsqrt2sequential/batch_normalization_1/batchnorm/add:z:0*
T0*
_output_shapes	
:ђ22
0sequential/batch_normalization_1/batchnorm/Rsqrtѓ
=sequential/batch_normalization_1/batchnorm/mul/ReadVariableOpReadVariableOpFsequential_batch_normalization_1_batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02?
=sequential/batch_normalization_1/batchnorm/mul/ReadVariableOpі
.sequential/batch_normalization_1/batchnorm/mulMul4sequential/batch_normalization_1/batchnorm/Rsqrt:y:0Esequential/batch_normalization_1/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ20
.sequential/batch_normalization_1/batchnorm/mulЬ
0sequential/batch_normalization_1/batchnorm/mul_1Mulsequential/p_re_lu/add:z:02sequential/batch_normalization_1/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ22
0sequential/batch_normalization_1/batchnorm/mul_1Ч
;sequential/batch_normalization_1/batchnorm/ReadVariableOp_1ReadVariableOpDsequential_batch_normalization_1_batchnorm_readvariableop_1_resource*
_output_shapes	
:ђ*
dtype02=
;sequential/batch_normalization_1/batchnorm/ReadVariableOp_1і
0sequential/batch_normalization_1/batchnorm/mul_2MulCsequential/batch_normalization_1/batchnorm/ReadVariableOp_1:value:02sequential/batch_normalization_1/batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ22
0sequential/batch_normalization_1/batchnorm/mul_2Ч
;sequential/batch_normalization_1/batchnorm/ReadVariableOp_2ReadVariableOpDsequential_batch_normalization_1_batchnorm_readvariableop_2_resource*
_output_shapes	
:ђ*
dtype02=
;sequential/batch_normalization_1/batchnorm/ReadVariableOp_2ѕ
.sequential/batch_normalization_1/batchnorm/subSubCsequential/batch_normalization_1/batchnorm/ReadVariableOp_2:value:04sequential/batch_normalization_1/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ20
.sequential/batch_normalization_1/batchnorm/subі
0sequential/batch_normalization_1/batchnorm/add_1AddV24sequential/batch_normalization_1/batchnorm/mul_1:z:02sequential/batch_normalization_1/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ22
0sequential/batch_normalization_1/batchnorm/add_1│
sequential/dropout_1/IdentityIdentity4sequential/batch_normalization_1/batchnorm/add_1:z:0*
T0*(
_output_shapes
:         ђ2
sequential/dropout_1/Identity╚
(sequential/dense_1/MatMul/ReadVariableOpReadVariableOp1sequential_dense_1_matmul_readvariableop_resource* 
_output_shapes
:
ђђ*
dtype02*
(sequential/dense_1/MatMul/ReadVariableOp═
sequential/dense_1/MatMulMatMul&sequential/dropout_1/Identity:output:00sequential/dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
sequential/dense_1/MatMulк
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:ђ*
dtype02+
)sequential/dense_1/BiasAdd/ReadVariableOp╬
sequential/dense_1/BiasAddBiasAdd#sequential/dense_1/MatMul:product:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ђ2
sequential/dense_1/BiasAddќ
sequential/p_re_lu_1/ReluRelu#sequential/dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu_1/Relu┤
#sequential/p_re_lu_1/ReadVariableOpReadVariableOp,sequential_p_re_lu_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype02%
#sequential/p_re_lu_1/ReadVariableOpј
sequential/p_re_lu_1/NegNeg+sequential/p_re_lu_1/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
sequential/p_re_lu_1/NegЌ
sequential/p_re_lu_1/Neg_1Neg#sequential/dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu_1/Neg_1Ћ
sequential/p_re_lu_1/Relu_1Relusequential/p_re_lu_1/Neg_1:y:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu_1/Relu_1и
sequential/p_re_lu_1/mulMulsequential/p_re_lu_1/Neg:y:0)sequential/p_re_lu_1/Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu_1/mulи
sequential/p_re_lu_1/addAddV2'sequential/p_re_lu_1/Relu:activations:0sequential/p_re_lu_1/mul:z:0*
T0*(
_output_shapes
:         ђ2
sequential/p_re_lu_1/addШ
9sequential/batch_normalization_2/batchnorm/ReadVariableOpReadVariableOpBsequential_batch_normalization_2_batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02;
9sequential/batch_normalization_2/batchnorm/ReadVariableOpЕ
0sequential/batch_normalization_2/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:22
0sequential/batch_normalization_2/batchnorm/add/yЇ
.sequential/batch_normalization_2/batchnorm/addAddV2Asequential/batch_normalization_2/batchnorm/ReadVariableOp:value:09sequential/batch_normalization_2/batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ20
.sequential/batch_normalization_2/batchnorm/addК
0sequential/batch_normalization_2/batchnorm/RsqrtRsqrt2sequential/batch_normalization_2/batchnorm/add:z:0*
T0*
_output_shapes	
:ђ22
0sequential/batch_normalization_2/batchnorm/Rsqrtѓ
=sequential/batch_normalization_2/batchnorm/mul/ReadVariableOpReadVariableOpFsequential_batch_normalization_2_batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02?
=sequential/batch_normalization_2/batchnorm/mul/ReadVariableOpі
.sequential/batch_normalization_2/batchnorm/mulMul4sequential/batch_normalization_2/batchnorm/Rsqrt:y:0Esequential/batch_normalization_2/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ20
.sequential/batch_normalization_2/batchnorm/mul­
0sequential/batch_normalization_2/batchnorm/mul_1Mulsequential/p_re_lu_1/add:z:02sequential/batch_normalization_2/batchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ22
0sequential/batch_normalization_2/batchnorm/mul_1Ч
;sequential/batch_normalization_2/batchnorm/ReadVariableOp_1ReadVariableOpDsequential_batch_normalization_2_batchnorm_readvariableop_1_resource*
_output_shapes	
:ђ*
dtype02=
;sequential/batch_normalization_2/batchnorm/ReadVariableOp_1і
0sequential/batch_normalization_2/batchnorm/mul_2MulCsequential/batch_normalization_2/batchnorm/ReadVariableOp_1:value:02sequential/batch_normalization_2/batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ22
0sequential/batch_normalization_2/batchnorm/mul_2Ч
;sequential/batch_normalization_2/batchnorm/ReadVariableOp_2ReadVariableOpDsequential_batch_normalization_2_batchnorm_readvariableop_2_resource*
_output_shapes	
:ђ*
dtype02=
;sequential/batch_normalization_2/batchnorm/ReadVariableOp_2ѕ
.sequential/batch_normalization_2/batchnorm/subSubCsequential/batch_normalization_2/batchnorm/ReadVariableOp_2:value:04sequential/batch_normalization_2/batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ20
.sequential/batch_normalization_2/batchnorm/subі
0sequential/batch_normalization_2/batchnorm/add_1AddV24sequential/batch_normalization_2/batchnorm/mul_1:z:02sequential/batch_normalization_2/batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ22
0sequential/batch_normalization_2/batchnorm/add_1│
sequential/dropout_2/IdentityIdentity4sequential/batch_normalization_2/batchnorm/add_1:z:0*
T0*(
_output_shapes
:         ђ2
sequential/dropout_2/IdentityК
(sequential/dense_2/MatMul/ReadVariableOpReadVariableOp1sequential_dense_2_matmul_readvariableop_resource*
_output_shapes
:	ђ@*
dtype02*
(sequential/dense_2/MatMul/ReadVariableOp╠
sequential/dense_2/MatMulMatMul&sequential/dropout_2/Identity:output:00sequential/dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2
sequential/dense_2/MatMul┼
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02+
)sequential/dense_2/BiasAdd/ReadVariableOp═
sequential/dense_2/BiasAddBiasAdd#sequential/dense_2/MatMul:product:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @2
sequential/dense_2/BiasAddЋ
sequential/p_re_lu_2/ReluRelu#sequential/dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:         @2
sequential/p_re_lu_2/Relu│
#sequential/p_re_lu_2/ReadVariableOpReadVariableOp,sequential_p_re_lu_2_readvariableop_resource*
_output_shapes
:@*
dtype02%
#sequential/p_re_lu_2/ReadVariableOpЇ
sequential/p_re_lu_2/NegNeg+sequential/p_re_lu_2/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
sequential/p_re_lu_2/Negќ
sequential/p_re_lu_2/Neg_1Neg#sequential/dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:         @2
sequential/p_re_lu_2/Neg_1ћ
sequential/p_re_lu_2/Relu_1Relusequential/p_re_lu_2/Neg_1:y:0*
T0*'
_output_shapes
:         @2
sequential/p_re_lu_2/Relu_1Х
sequential/p_re_lu_2/mulMulsequential/p_re_lu_2/Neg:y:0)sequential/p_re_lu_2/Relu_1:activations:0*
T0*'
_output_shapes
:         @2
sequential/p_re_lu_2/mulХ
sequential/p_re_lu_2/addAddV2'sequential/p_re_lu_2/Relu:activations:0sequential/p_re_lu_2/mul:z:0*
T0*'
_output_shapes
:         @2
sequential/p_re_lu_2/addш
9sequential/batch_normalization_3/batchnorm/ReadVariableOpReadVariableOpBsequential_batch_normalization_3_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02;
9sequential/batch_normalization_3/batchnorm/ReadVariableOpЕ
0sequential/batch_normalization_3/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:22
0sequential/batch_normalization_3/batchnorm/add/yї
.sequential/batch_normalization_3/batchnorm/addAddV2Asequential/batch_normalization_3/batchnorm/ReadVariableOp:value:09sequential/batch_normalization_3/batchnorm/add/y:output:0*
T0*
_output_shapes
:@20
.sequential/batch_normalization_3/batchnorm/addк
0sequential/batch_normalization_3/batchnorm/RsqrtRsqrt2sequential/batch_normalization_3/batchnorm/add:z:0*
T0*
_output_shapes
:@22
0sequential/batch_normalization_3/batchnorm/RsqrtЂ
=sequential/batch_normalization_3/batchnorm/mul/ReadVariableOpReadVariableOpFsequential_batch_normalization_3_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02?
=sequential/batch_normalization_3/batchnorm/mul/ReadVariableOpЅ
.sequential/batch_normalization_3/batchnorm/mulMul4sequential/batch_normalization_3/batchnorm/Rsqrt:y:0Esequential/batch_normalization_3/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@20
.sequential/batch_normalization_3/batchnorm/mul№
0sequential/batch_normalization_3/batchnorm/mul_1Mulsequential/p_re_lu_2/add:z:02sequential/batch_normalization_3/batchnorm/mul:z:0*
T0*'
_output_shapes
:         @22
0sequential/batch_normalization_3/batchnorm/mul_1ч
;sequential/batch_normalization_3/batchnorm/ReadVariableOp_1ReadVariableOpDsequential_batch_normalization_3_batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype02=
;sequential/batch_normalization_3/batchnorm/ReadVariableOp_1Ѕ
0sequential/batch_normalization_3/batchnorm/mul_2MulCsequential/batch_normalization_3/batchnorm/ReadVariableOp_1:value:02sequential/batch_normalization_3/batchnorm/mul:z:0*
T0*
_output_shapes
:@22
0sequential/batch_normalization_3/batchnorm/mul_2ч
;sequential/batch_normalization_3/batchnorm/ReadVariableOp_2ReadVariableOpDsequential_batch_normalization_3_batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype02=
;sequential/batch_normalization_3/batchnorm/ReadVariableOp_2Є
.sequential/batch_normalization_3/batchnorm/subSubCsequential/batch_normalization_3/batchnorm/ReadVariableOp_2:value:04sequential/batch_normalization_3/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@20
.sequential/batch_normalization_3/batchnorm/subЅ
0sequential/batch_normalization_3/batchnorm/add_1AddV24sequential/batch_normalization_3/batchnorm/mul_1:z:02sequential/batch_normalization_3/batchnorm/sub:z:0*
T0*'
_output_shapes
:         @22
0sequential/batch_normalization_3/batchnorm/add_1▓
sequential/dropout_3/IdentityIdentity4sequential/batch_normalization_3/batchnorm/add_1:z:0*
T0*'
_output_shapes
:         @2
sequential/dropout_3/Identityк
(sequential/dense_3/MatMul/ReadVariableOpReadVariableOp1sequential_dense_3_matmul_readvariableop_resource*
_output_shapes

:@*
dtype02*
(sequential/dense_3/MatMul/ReadVariableOp╠
sequential/dense_3/MatMulMatMul&sequential/dropout_3/Identity:output:00sequential/dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
sequential/dense_3/MatMul┼
)sequential/dense_3/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02+
)sequential/dense_3/BiasAdd/ReadVariableOp═
sequential/dense_3/BiasAddBiasAdd#sequential/dense_3/MatMul:product:01sequential/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         2
sequential/dense_3/BiasAddЮ
sequential/dense_3/SoftplusSoftplus#sequential/dense_3/BiasAdd:output:0*
T0*'
_output_shapes
:         2
sequential/dense_3/Softplusё
IdentityIdentity)sequential/dense_3/Softplus:activations:0^NoOp*
T0*'
_output_shapes
:         2

IdentityЬ
NoOpNoOp8^sequential/batch_normalization/batchnorm/ReadVariableOp:^sequential/batch_normalization/batchnorm/ReadVariableOp_1:^sequential/batch_normalization/batchnorm/ReadVariableOp_2<^sequential/batch_normalization/batchnorm/mul/ReadVariableOp:^sequential/batch_normalization_1/batchnorm/ReadVariableOp<^sequential/batch_normalization_1/batchnorm/ReadVariableOp_1<^sequential/batch_normalization_1/batchnorm/ReadVariableOp_2>^sequential/batch_normalization_1/batchnorm/mul/ReadVariableOp:^sequential/batch_normalization_2/batchnorm/ReadVariableOp<^sequential/batch_normalization_2/batchnorm/ReadVariableOp_1<^sequential/batch_normalization_2/batchnorm/ReadVariableOp_2>^sequential/batch_normalization_2/batchnorm/mul/ReadVariableOp:^sequential/batch_normalization_3/batchnorm/ReadVariableOp<^sequential/batch_normalization_3/batchnorm/ReadVariableOp_1<^sequential/batch_normalization_3/batchnorm/ReadVariableOp_2>^sequential/batch_normalization_3/batchnorm/mul/ReadVariableOp(^sequential/dense/BiasAdd/ReadVariableOp'^sequential/dense/MatMul/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp)^sequential/dense_1/MatMul/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp)^sequential/dense_2/MatMul/ReadVariableOp*^sequential/dense_3/BiasAdd/ReadVariableOp)^sequential/dense_3/MatMul/ReadVariableOp"^sequential/p_re_lu/ReadVariableOp$^sequential/p_re_lu_1/ReadVariableOp$^sequential/p_re_lu_2/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 2r
7sequential/batch_normalization/batchnorm/ReadVariableOp7sequential/batch_normalization/batchnorm/ReadVariableOp2v
9sequential/batch_normalization/batchnorm/ReadVariableOp_19sequential/batch_normalization/batchnorm/ReadVariableOp_12v
9sequential/batch_normalization/batchnorm/ReadVariableOp_29sequential/batch_normalization/batchnorm/ReadVariableOp_22z
;sequential/batch_normalization/batchnorm/mul/ReadVariableOp;sequential/batch_normalization/batchnorm/mul/ReadVariableOp2v
9sequential/batch_normalization_1/batchnorm/ReadVariableOp9sequential/batch_normalization_1/batchnorm/ReadVariableOp2z
;sequential/batch_normalization_1/batchnorm/ReadVariableOp_1;sequential/batch_normalization_1/batchnorm/ReadVariableOp_12z
;sequential/batch_normalization_1/batchnorm/ReadVariableOp_2;sequential/batch_normalization_1/batchnorm/ReadVariableOp_22~
=sequential/batch_normalization_1/batchnorm/mul/ReadVariableOp=sequential/batch_normalization_1/batchnorm/mul/ReadVariableOp2v
9sequential/batch_normalization_2/batchnorm/ReadVariableOp9sequential/batch_normalization_2/batchnorm/ReadVariableOp2z
;sequential/batch_normalization_2/batchnorm/ReadVariableOp_1;sequential/batch_normalization_2/batchnorm/ReadVariableOp_12z
;sequential/batch_normalization_2/batchnorm/ReadVariableOp_2;sequential/batch_normalization_2/batchnorm/ReadVariableOp_22~
=sequential/batch_normalization_2/batchnorm/mul/ReadVariableOp=sequential/batch_normalization_2/batchnorm/mul/ReadVariableOp2v
9sequential/batch_normalization_3/batchnorm/ReadVariableOp9sequential/batch_normalization_3/batchnorm/ReadVariableOp2z
;sequential/batch_normalization_3/batchnorm/ReadVariableOp_1;sequential/batch_normalization_3/batchnorm/ReadVariableOp_12z
;sequential/batch_normalization_3/batchnorm/ReadVariableOp_2;sequential/batch_normalization_3/batchnorm/ReadVariableOp_22~
=sequential/batch_normalization_3/batchnorm/mul/ReadVariableOp=sequential/batch_normalization_3/batchnorm/mul/ReadVariableOp2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2P
&sequential/dense/MatMul/ReadVariableOp&sequential/dense/MatMul/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2T
(sequential/dense_1/MatMul/ReadVariableOp(sequential/dense_1/MatMul/ReadVariableOp2V
)sequential/dense_2/BiasAdd/ReadVariableOp)sequential/dense_2/BiasAdd/ReadVariableOp2T
(sequential/dense_2/MatMul/ReadVariableOp(sequential/dense_2/MatMul/ReadVariableOp2V
)sequential/dense_3/BiasAdd/ReadVariableOp)sequential/dense_3/BiasAdd/ReadVariableOp2T
(sequential/dense_3/MatMul/ReadVariableOp(sequential/dense_3/MatMul/ReadVariableOp2F
!sequential/p_re_lu/ReadVariableOp!sequential/p_re_lu/ReadVariableOp2J
#sequential/p_re_lu_1/ReadVariableOp#sequential/p_re_lu_1/ReadVariableOp2J
#sequential/p_re_lu_2/ReadVariableOp#sequential/p_re_lu_2/ReadVariableOp:Q M
(
_output_shapes
:         ├
!
_user_specified_name	input_1
ы
b
D__inference_dropout_3_layer_call_and_return_conditional_losses_10390

inputs

identity_1Z
IdentityIdentityinputs*
T0*'
_output_shapes
:         @2

Identityi

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:         @2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
ш
b
D__inference_dropout_2_layer_call_and_return_conditional_losses_11940

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:         ђ2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:         ђ2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
▒
a
B__inference_dropout_layer_call_and_return_conditional_losses_10617

inputs
identityѕc
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:         ├2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shapeх
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:         ├*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2
dropout/GreaterEqual/y┐
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ├2
dropout/GreaterEqualђ
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ├2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:         ├2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:         ├2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ├:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
у*
ь
P__inference_batch_normalization_1_layer_call_and_return_conditional_losses_11745

inputs6
'assignmovingavg_readvariableop_resource:	ђ8
)assignmovingavg_1_readvariableop_resource:	ђ4
%batchnorm_mul_readvariableop_resource:	ђ0
!batchnorm_readvariableop_resource:	ђ
identityѕбAssignMovingAvgбAssignMovingAvg/ReadVariableOpбAssignMovingAvg_1б AssignMovingAvg_1/ReadVariableOpбbatchnorm/ReadVariableOpбbatchnorm/mul/ReadVariableOpі
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indicesљ
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2
moments/mean}
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes
:	ђ2
moments/StopGradientЦ
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*(
_output_shapes
:         ђ2
moments/SquaredDifferenceњ
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices│
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes
:	ђ*
	keep_dims(2
moments/varianceЂ
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2
moments/SqueezeЅ
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes	
:ђ*
squeeze_dims
 2
moments/Squeeze_1s
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg/decayЦ
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes	
:ђ*
dtype02 
AssignMovingAvg/ReadVariableOpЎ
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg/subљ
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg/mul┐
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvgw
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
О#<2
AssignMovingAvg_1/decayФ
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes	
:ђ*
dtype02"
 AssignMovingAvg_1/ReadVariableOpА
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg_1/subў
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes	
:ђ2
AssignMovingAvg_1/mul╔
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype02
AssignMovingAvg_1g
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЃ
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/mul_1|
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/mul_2Њ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOpѓ
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

IdentityЫ
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
щ
Ќ
'__inference_dense_1_layer_call_fn_11817

inputs
unknown:
ђђ
	unknown_0:	ђ
identityѕбStatefulPartitionedCallЭ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_103082
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         ђ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
є
│
P__inference_batch_normalization_2_layer_call_and_return_conditional_losses_11875

inputs0
!batchnorm_readvariableop_resource:	ђ4
%batchnorm_mul_readvariableop_resource:	ђ2
#batchnorm_readvariableop_1_resource:	ђ2
#batchnorm_readvariableop_2_resource:	ђ
identityѕбbatchnorm/ReadVariableOpбbatchnorm/ReadVariableOp_1бbatchnorm/ReadVariableOp_2бbatchnorm/mul/ReadVariableOpЊ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЅ
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:ђ2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/mul_1Ў
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOp_1є
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/mul_2Ў
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:ђ*
dtype02
batchnorm/ReadVariableOp_2ё
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:ђ2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ђ2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity┬
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ђ: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
│
c
D__inference_dropout_1_layer_call_and_return_conditional_losses_11788

inputs
identityѕc
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:         ђ2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shapeх
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:         ђ*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2
dropout/GreaterEqual/y┐
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ђ2
dropout/GreaterEqualђ
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ђ2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:         ђ2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:         ђ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
Ч	
Џ
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_10042

inputs%
readvariableop_resource:@
identityѕбReadVariableOpW
ReluReluinputs*
T0*0
_output_shapes
:                  2
Relut
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:@*
dtype02
ReadVariableOpN
NegNegReadVariableOp:value:0*
T0*
_output_shapes
:@2
NegX
Neg_1Neginputs*
T0*0
_output_shapes
:                  2
Neg_1^
Relu_1Relu	Neg_1:y:0*
T0*0
_output_shapes
:                  2
Relu_1b
mulMulNeg:y:0Relu_1:activations:0*
T0*'
_output_shapes
:         @2
mulb
addAddV2Relu:activations:0mul:z:0*
T0*'
_output_shapes
:         @2
addb
IdentityIdentityadd:z:0^NoOp*
T0*'
_output_shapes
:         @2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 2 
ReadVariableOpReadVariableOp:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
ё
▒
N__inference_batch_normalization_layer_call_and_return_conditional_losses_11547

inputs0
!batchnorm_readvariableop_resource:	├4
%batchnorm_mul_readvariableop_resource:	├2
#batchnorm_readvariableop_1_resource:	├2
#batchnorm_readvariableop_2_resource:	├
identityѕбbatchnorm/ReadVariableOpбbatchnorm/ReadVariableOp_1бbatchnorm/ReadVariableOp_2бbatchnorm/mul/ReadVariableOpЊ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes	
:├*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yЅ
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes	
:├2
batchnorm/addd
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes	
:├2
batchnorm/RsqrtЪ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes	
:├*
dtype02
batchnorm/mul/ReadVariableOpє
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes	
:├2
batchnorm/mulw
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*(
_output_shapes
:         ├2
batchnorm/mul_1Ў
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes	
:├*
dtype02
batchnorm/ReadVariableOp_1є
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes	
:├2
batchnorm/mul_2Ў
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes	
:├*
dtype02
batchnorm/ReadVariableOp_2ё
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes	
:├2
batchnorm/subє
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*(
_output_shapes
:         ├2
batchnorm/add_1o
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*(
_output_shapes
:         ├2

Identity┬
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:         ├: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
П
z
)__inference_p_re_lu_1_layer_call_fn_11848

inputs
unknown:	ђ
identityѕбStatefulPartitionedCallВ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *L
fGRE
C__inference_p_re_lu_1_layer_call_and_return_conditional_losses_98402
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
м╠
░1
!__inference__traced_restore_12641
file_prefix9
*assignvariableop_batch_normalization_gamma:	├:
+assignvariableop_1_batch_normalization_beta:	├A
2assignvariableop_2_batch_normalization_moving_mean:	├E
6assignvariableop_3_batch_normalization_moving_variance:	├3
assignvariableop_4_dense_kernel:
├ђ,
assignvariableop_5_dense_bias:	ђ/
 assignvariableop_6_p_re_lu_alpha:	ђ=
.assignvariableop_7_batch_normalization_1_gamma:	ђ<
-assignvariableop_8_batch_normalization_1_beta:	ђC
4assignvariableop_9_batch_normalization_1_moving_mean:	ђH
9assignvariableop_10_batch_normalization_1_moving_variance:	ђ6
"assignvariableop_11_dense_1_kernel:
ђђ/
 assignvariableop_12_dense_1_bias:	ђ2
#assignvariableop_13_p_re_lu_1_alpha:	ђ>
/assignvariableop_14_batch_normalization_2_gamma:	ђ=
.assignvariableop_15_batch_normalization_2_beta:	ђD
5assignvariableop_16_batch_normalization_2_moving_mean:	ђH
9assignvariableop_17_batch_normalization_2_moving_variance:	ђ5
"assignvariableop_18_dense_2_kernel:	ђ@.
 assignvariableop_19_dense_2_bias:@1
#assignvariableop_20_p_re_lu_2_alpha:@=
/assignvariableop_21_batch_normalization_3_gamma:@<
.assignvariableop_22_batch_normalization_3_beta:@C
5assignvariableop_23_batch_normalization_3_moving_mean:@G
9assignvariableop_24_batch_normalization_3_moving_variance:@4
"assignvariableop_25_dense_3_kernel:@.
 assignvariableop_26_dense_3_bias:(
assignvariableop_27_nadam_iter:	 *
 assignvariableop_28_nadam_beta_1: *
 assignvariableop_29_nadam_beta_2: )
assignvariableop_30_nadam_decay: 1
'assignvariableop_31_nadam_learning_rate: 2
(assignvariableop_32_nadam_momentum_cache: #
assignvariableop_33_total: #
assignvariableop_34_count: %
assignvariableop_35_total_1: %
assignvariableop_36_count_1: %
assignvariableop_37_total_2: %
assignvariableop_38_count_2: D
5assignvariableop_39_nadam_batch_normalization_gamma_m:	├C
4assignvariableop_40_nadam_batch_normalization_beta_m:	├<
(assignvariableop_41_nadam_dense_kernel_m:
├ђ5
&assignvariableop_42_nadam_dense_bias_m:	ђ8
)assignvariableop_43_nadam_p_re_lu_alpha_m:	ђF
7assignvariableop_44_nadam_batch_normalization_1_gamma_m:	ђE
6assignvariableop_45_nadam_batch_normalization_1_beta_m:	ђ>
*assignvariableop_46_nadam_dense_1_kernel_m:
ђђ7
(assignvariableop_47_nadam_dense_1_bias_m:	ђ:
+assignvariableop_48_nadam_p_re_lu_1_alpha_m:	ђF
7assignvariableop_49_nadam_batch_normalization_2_gamma_m:	ђE
6assignvariableop_50_nadam_batch_normalization_2_beta_m:	ђ=
*assignvariableop_51_nadam_dense_2_kernel_m:	ђ@6
(assignvariableop_52_nadam_dense_2_bias_m:@9
+assignvariableop_53_nadam_p_re_lu_2_alpha_m:@E
7assignvariableop_54_nadam_batch_normalization_3_gamma_m:@D
6assignvariableop_55_nadam_batch_normalization_3_beta_m:@<
*assignvariableop_56_nadam_dense_3_kernel_m:@6
(assignvariableop_57_nadam_dense_3_bias_m:D
5assignvariableop_58_nadam_batch_normalization_gamma_v:	├C
4assignvariableop_59_nadam_batch_normalization_beta_v:	├<
(assignvariableop_60_nadam_dense_kernel_v:
├ђ5
&assignvariableop_61_nadam_dense_bias_v:	ђ8
)assignvariableop_62_nadam_p_re_lu_alpha_v:	ђF
7assignvariableop_63_nadam_batch_normalization_1_gamma_v:	ђE
6assignvariableop_64_nadam_batch_normalization_1_beta_v:	ђ>
*assignvariableop_65_nadam_dense_1_kernel_v:
ђђ7
(assignvariableop_66_nadam_dense_1_bias_v:	ђ:
+assignvariableop_67_nadam_p_re_lu_1_alpha_v:	ђF
7assignvariableop_68_nadam_batch_normalization_2_gamma_v:	ђE
6assignvariableop_69_nadam_batch_normalization_2_beta_v:	ђ=
*assignvariableop_70_nadam_dense_2_kernel_v:	ђ@6
(assignvariableop_71_nadam_dense_2_bias_v:@9
+assignvariableop_72_nadam_p_re_lu_2_alpha_v:@E
7assignvariableop_73_nadam_batch_normalization_3_gamma_v:@D
6assignvariableop_74_nadam_batch_normalization_3_beta_v:@<
*assignvariableop_75_nadam_dense_3_kernel_v:@6
(assignvariableop_76_nadam_dense_3_bias_v:
identity_78ѕбAssignVariableOpбAssignVariableOp_1бAssignVariableOp_10бAssignVariableOp_11бAssignVariableOp_12бAssignVariableOp_13бAssignVariableOp_14бAssignVariableOp_15бAssignVariableOp_16бAssignVariableOp_17бAssignVariableOp_18бAssignVariableOp_19бAssignVariableOp_2бAssignVariableOp_20бAssignVariableOp_21бAssignVariableOp_22бAssignVariableOp_23бAssignVariableOp_24бAssignVariableOp_25бAssignVariableOp_26бAssignVariableOp_27бAssignVariableOp_28бAssignVariableOp_29бAssignVariableOp_3бAssignVariableOp_30бAssignVariableOp_31бAssignVariableOp_32бAssignVariableOp_33бAssignVariableOp_34бAssignVariableOp_35бAssignVariableOp_36бAssignVariableOp_37бAssignVariableOp_38бAssignVariableOp_39бAssignVariableOp_4бAssignVariableOp_40бAssignVariableOp_41бAssignVariableOp_42бAssignVariableOp_43бAssignVariableOp_44бAssignVariableOp_45бAssignVariableOp_46бAssignVariableOp_47бAssignVariableOp_48бAssignVariableOp_49бAssignVariableOp_5бAssignVariableOp_50бAssignVariableOp_51бAssignVariableOp_52бAssignVariableOp_53бAssignVariableOp_54бAssignVariableOp_55бAssignVariableOp_56бAssignVariableOp_57бAssignVariableOp_58бAssignVariableOp_59бAssignVariableOp_6бAssignVariableOp_60бAssignVariableOp_61бAssignVariableOp_62бAssignVariableOp_63бAssignVariableOp_64бAssignVariableOp_65бAssignVariableOp_66бAssignVariableOp_67бAssignVariableOp_68бAssignVariableOp_69бAssignVariableOp_7бAssignVariableOp_70бAssignVariableOp_71бAssignVariableOp_72бAssignVariableOp_73бAssignVariableOp_74бAssignVariableOp_75бAssignVariableOp_76бAssignVariableOp_8бAssignVariableOp_9я*
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:N*
dtype0*Ж)
valueЯ)BП)NB5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-0/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-0/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-2/alpha/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-5/alpha/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-6/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-6/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-6/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-8/alpha/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-10/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/momentum_cache/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-0/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-2/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-5/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-6/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-8/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-10/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-0/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-2/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-5/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-6/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-8/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-10/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_namesГ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:N*
dtype0*▒
valueДBцNB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices┤
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*╬
_output_shapes╗
И::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*\
dtypesR
P2N	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

IdentityЕ
AssignVariableOpAssignVariableOp*assignvariableop_batch_normalization_gammaIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1░
AssignVariableOp_1AssignVariableOp+assignvariableop_1_batch_normalization_betaIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2и
AssignVariableOp_2AssignVariableOp2assignvariableop_2_batch_normalization_moving_meanIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3╗
AssignVariableOp_3AssignVariableOp6assignvariableop_3_batch_normalization_moving_varianceIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4ц
AssignVariableOp_4AssignVariableOpassignvariableop_4_dense_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5б
AssignVariableOp_5AssignVariableOpassignvariableop_5_dense_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6Ц
AssignVariableOp_6AssignVariableOp assignvariableop_6_p_re_lu_alphaIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7│
AssignVariableOp_7AssignVariableOp.assignvariableop_7_batch_normalization_1_gammaIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8▓
AssignVariableOp_8AssignVariableOp-assignvariableop_8_batch_normalization_1_betaIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9╣
AssignVariableOp_9AssignVariableOp4assignvariableop_9_batch_normalization_1_moving_meanIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10┴
AssignVariableOp_10AssignVariableOp9assignvariableop_10_batch_normalization_1_moving_varianceIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11ф
AssignVariableOp_11AssignVariableOp"assignvariableop_11_dense_1_kernelIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12е
AssignVariableOp_12AssignVariableOp assignvariableop_12_dense_1_biasIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13Ф
AssignVariableOp_13AssignVariableOp#assignvariableop_13_p_re_lu_1_alphaIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14и
AssignVariableOp_14AssignVariableOp/assignvariableop_14_batch_normalization_2_gammaIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15Х
AssignVariableOp_15AssignVariableOp.assignvariableop_15_batch_normalization_2_betaIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16й
AssignVariableOp_16AssignVariableOp5assignvariableop_16_batch_normalization_2_moving_meanIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17┴
AssignVariableOp_17AssignVariableOp9assignvariableop_17_batch_normalization_2_moving_varianceIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18ф
AssignVariableOp_18AssignVariableOp"assignvariableop_18_dense_2_kernelIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19е
AssignVariableOp_19AssignVariableOp assignvariableop_19_dense_2_biasIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20Ф
AssignVariableOp_20AssignVariableOp#assignvariableop_20_p_re_lu_2_alphaIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21и
AssignVariableOp_21AssignVariableOp/assignvariableop_21_batch_normalization_3_gammaIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22Х
AssignVariableOp_22AssignVariableOp.assignvariableop_22_batch_normalization_3_betaIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23й
AssignVariableOp_23AssignVariableOp5assignvariableop_23_batch_normalization_3_moving_meanIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24┴
AssignVariableOp_24AssignVariableOp9assignvariableop_24_batch_normalization_3_moving_varianceIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25ф
AssignVariableOp_25AssignVariableOp"assignvariableop_25_dense_3_kernelIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26е
AssignVariableOp_26AssignVariableOp assignvariableop_26_dense_3_biasIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0	*
_output_shapes
:2
Identity_27д
AssignVariableOp_27AssignVariableOpassignvariableop_27_nadam_iterIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28е
AssignVariableOp_28AssignVariableOp assignvariableop_28_nadam_beta_1Identity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29е
AssignVariableOp_29AssignVariableOp assignvariableop_29_nadam_beta_2Identity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30Д
AssignVariableOp_30AssignVariableOpassignvariableop_30_nadam_decayIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31»
AssignVariableOp_31AssignVariableOp'assignvariableop_31_nadam_learning_rateIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32░
AssignVariableOp_32AssignVariableOp(assignvariableop_32_nadam_momentum_cacheIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_32n
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:2
Identity_33А
AssignVariableOp_33AssignVariableOpassignvariableop_33_totalIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_33n
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:2
Identity_34А
AssignVariableOp_34AssignVariableOpassignvariableop_34_countIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_34n
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:2
Identity_35Б
AssignVariableOp_35AssignVariableOpassignvariableop_35_total_1Identity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_35n
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:2
Identity_36Б
AssignVariableOp_36AssignVariableOpassignvariableop_36_count_1Identity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_36n
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:2
Identity_37Б
AssignVariableOp_37AssignVariableOpassignvariableop_37_total_2Identity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_37n
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:2
Identity_38Б
AssignVariableOp_38AssignVariableOpassignvariableop_38_count_2Identity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_38n
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:2
Identity_39й
AssignVariableOp_39AssignVariableOp5assignvariableop_39_nadam_batch_normalization_gamma_mIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_39n
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:2
Identity_40╝
AssignVariableOp_40AssignVariableOp4assignvariableop_40_nadam_batch_normalization_beta_mIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_40n
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:2
Identity_41░
AssignVariableOp_41AssignVariableOp(assignvariableop_41_nadam_dense_kernel_mIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_41n
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:2
Identity_42«
AssignVariableOp_42AssignVariableOp&assignvariableop_42_nadam_dense_bias_mIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_42n
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:2
Identity_43▒
AssignVariableOp_43AssignVariableOp)assignvariableop_43_nadam_p_re_lu_alpha_mIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_43n
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:2
Identity_44┐
AssignVariableOp_44AssignVariableOp7assignvariableop_44_nadam_batch_normalization_1_gamma_mIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_44n
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:2
Identity_45Й
AssignVariableOp_45AssignVariableOp6assignvariableop_45_nadam_batch_normalization_1_beta_mIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_45n
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:2
Identity_46▓
AssignVariableOp_46AssignVariableOp*assignvariableop_46_nadam_dense_1_kernel_mIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_46n
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:2
Identity_47░
AssignVariableOp_47AssignVariableOp(assignvariableop_47_nadam_dense_1_bias_mIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_47n
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:2
Identity_48│
AssignVariableOp_48AssignVariableOp+assignvariableop_48_nadam_p_re_lu_1_alpha_mIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_48n
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:2
Identity_49┐
AssignVariableOp_49AssignVariableOp7assignvariableop_49_nadam_batch_normalization_2_gamma_mIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_49n
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:2
Identity_50Й
AssignVariableOp_50AssignVariableOp6assignvariableop_50_nadam_batch_normalization_2_beta_mIdentity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_50n
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:2
Identity_51▓
AssignVariableOp_51AssignVariableOp*assignvariableop_51_nadam_dense_2_kernel_mIdentity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_51n
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:2
Identity_52░
AssignVariableOp_52AssignVariableOp(assignvariableop_52_nadam_dense_2_bias_mIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_52n
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:2
Identity_53│
AssignVariableOp_53AssignVariableOp+assignvariableop_53_nadam_p_re_lu_2_alpha_mIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_53n
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:2
Identity_54┐
AssignVariableOp_54AssignVariableOp7assignvariableop_54_nadam_batch_normalization_3_gamma_mIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_54n
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:2
Identity_55Й
AssignVariableOp_55AssignVariableOp6assignvariableop_55_nadam_batch_normalization_3_beta_mIdentity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_55n
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:2
Identity_56▓
AssignVariableOp_56AssignVariableOp*assignvariableop_56_nadam_dense_3_kernel_mIdentity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_56n
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:2
Identity_57░
AssignVariableOp_57AssignVariableOp(assignvariableop_57_nadam_dense_3_bias_mIdentity_57:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_57n
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:2
Identity_58й
AssignVariableOp_58AssignVariableOp5assignvariableop_58_nadam_batch_normalization_gamma_vIdentity_58:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_58n
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:2
Identity_59╝
AssignVariableOp_59AssignVariableOp4assignvariableop_59_nadam_batch_normalization_beta_vIdentity_59:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_59n
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:2
Identity_60░
AssignVariableOp_60AssignVariableOp(assignvariableop_60_nadam_dense_kernel_vIdentity_60:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_60n
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:2
Identity_61«
AssignVariableOp_61AssignVariableOp&assignvariableop_61_nadam_dense_bias_vIdentity_61:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_61n
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:2
Identity_62▒
AssignVariableOp_62AssignVariableOp)assignvariableop_62_nadam_p_re_lu_alpha_vIdentity_62:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_62n
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:2
Identity_63┐
AssignVariableOp_63AssignVariableOp7assignvariableop_63_nadam_batch_normalization_1_gamma_vIdentity_63:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_63n
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:2
Identity_64Й
AssignVariableOp_64AssignVariableOp6assignvariableop_64_nadam_batch_normalization_1_beta_vIdentity_64:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_64n
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:2
Identity_65▓
AssignVariableOp_65AssignVariableOp*assignvariableop_65_nadam_dense_1_kernel_vIdentity_65:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_65n
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:2
Identity_66░
AssignVariableOp_66AssignVariableOp(assignvariableop_66_nadam_dense_1_bias_vIdentity_66:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_66n
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:2
Identity_67│
AssignVariableOp_67AssignVariableOp+assignvariableop_67_nadam_p_re_lu_1_alpha_vIdentity_67:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_67n
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:2
Identity_68┐
AssignVariableOp_68AssignVariableOp7assignvariableop_68_nadam_batch_normalization_2_gamma_vIdentity_68:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_68n
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:2
Identity_69Й
AssignVariableOp_69AssignVariableOp6assignvariableop_69_nadam_batch_normalization_2_beta_vIdentity_69:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_69n
Identity_70IdentityRestoreV2:tensors:70"/device:CPU:0*
T0*
_output_shapes
:2
Identity_70▓
AssignVariableOp_70AssignVariableOp*assignvariableop_70_nadam_dense_2_kernel_vIdentity_70:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_70n
Identity_71IdentityRestoreV2:tensors:71"/device:CPU:0*
T0*
_output_shapes
:2
Identity_71░
AssignVariableOp_71AssignVariableOp(assignvariableop_71_nadam_dense_2_bias_vIdentity_71:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_71n
Identity_72IdentityRestoreV2:tensors:72"/device:CPU:0*
T0*
_output_shapes
:2
Identity_72│
AssignVariableOp_72AssignVariableOp+assignvariableop_72_nadam_p_re_lu_2_alpha_vIdentity_72:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_72n
Identity_73IdentityRestoreV2:tensors:73"/device:CPU:0*
T0*
_output_shapes
:2
Identity_73┐
AssignVariableOp_73AssignVariableOp7assignvariableop_73_nadam_batch_normalization_3_gamma_vIdentity_73:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_73n
Identity_74IdentityRestoreV2:tensors:74"/device:CPU:0*
T0*
_output_shapes
:2
Identity_74Й
AssignVariableOp_74AssignVariableOp6assignvariableop_74_nadam_batch_normalization_3_beta_vIdentity_74:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_74n
Identity_75IdentityRestoreV2:tensors:75"/device:CPU:0*
T0*
_output_shapes
:2
Identity_75▓
AssignVariableOp_75AssignVariableOp*assignvariableop_75_nadam_dense_3_kernel_vIdentity_75:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_75n
Identity_76IdentityRestoreV2:tensors:76"/device:CPU:0*
T0*
_output_shapes
:2
Identity_76░
AssignVariableOp_76AssignVariableOp(assignvariableop_76_nadam_dense_3_bias_vIdentity_76:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_769
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOpЧ
Identity_77Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_77f
Identity_78IdentityIdentity_77:output:0^NoOp_1*
T0*
_output_shapes
: 2
Identity_78С
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 2
NoOp_1"#
identity_78Identity_78:output:0*▒
_input_shapesЪ
ю: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562*
AssignVariableOp_57AssignVariableOp_572*
AssignVariableOp_58AssignVariableOp_582*
AssignVariableOp_59AssignVariableOp_592(
AssignVariableOp_6AssignVariableOp_62*
AssignVariableOp_60AssignVariableOp_602*
AssignVariableOp_61AssignVariableOp_612*
AssignVariableOp_62AssignVariableOp_622*
AssignVariableOp_63AssignVariableOp_632*
AssignVariableOp_64AssignVariableOp_642*
AssignVariableOp_65AssignVariableOp_652*
AssignVariableOp_66AssignVariableOp_662*
AssignVariableOp_67AssignVariableOp_672*
AssignVariableOp_68AssignVariableOp_682*
AssignVariableOp_69AssignVariableOp_692(
AssignVariableOp_7AssignVariableOp_72*
AssignVariableOp_70AssignVariableOp_702*
AssignVariableOp_71AssignVariableOp_712*
AssignVariableOp_72AssignVariableOp_722*
AssignVariableOp_73AssignVariableOp_732*
AssignVariableOp_74AssignVariableOp_742*
AssignVariableOp_75AssignVariableOp_752*
AssignVariableOp_76AssignVariableOp_762(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
аO
ъ
E__inference_sequential_layer_call_and_return_conditional_losses_10410

inputs(
batch_normalization_10235:	├(
batch_normalization_10237:	├(
batch_normalization_10239:	├(
batch_normalization_10241:	├
dense_10262:
├ђ
dense_10264:	ђ
p_re_lu_10279:	ђ*
batch_normalization_1_10282:	ђ*
batch_normalization_1_10284:	ђ*
batch_normalization_1_10286:	ђ*
batch_normalization_1_10288:	ђ!
dense_1_10309:
ђђ
dense_1_10311:	ђ
p_re_lu_1_10326:	ђ*
batch_normalization_2_10329:	ђ*
batch_normalization_2_10331:	ђ*
batch_normalization_2_10333:	ђ*
batch_normalization_2_10335:	ђ 
dense_2_10356:	ђ@
dense_2_10358:@
p_re_lu_2_10373:@)
batch_normalization_3_10376:@)
batch_normalization_3_10378:@)
batch_normalization_3_10380:@)
batch_normalization_3_10382:@
dense_3_10404:@
dense_3_10406:
identityѕб+batch_normalization/StatefulPartitionedCallб-batch_normalization_1/StatefulPartitionedCallб-batch_normalization_2/StatefulPartitionedCallб-batch_normalization_3/StatefulPartitionedCallбdense/StatefulPartitionedCallбdense_1/StatefulPartitionedCallбdense_2/StatefulPartitionedCallбdense_3/StatefulPartitionedCallбp_re_lu/StatefulPartitionedCallб!p_re_lu_1/StatefulPartitionedCallб!p_re_lu_2/StatefulPartitionedCallЄ
+batch_normalization/StatefulPartitionedCallStatefulPartitionedCallinputsbatch_normalization_10235batch_normalization_10237batch_normalization_10239batch_normalization_10241*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *V
fQRO
M__inference_batch_normalization_layer_call_and_return_conditional_losses_94842-
+batch_normalization/StatefulPartitionedCallё
dropout/PartitionedCallPartitionedCall4batch_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ├* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dropout_layer_call_and_return_conditional_losses_102492
dropout/PartitionedCallб
dense/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0dense_10262dense_10264*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_102612
dense/StatefulPartitionedCallА
p_re_lu/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0p_re_lu_10279*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_p_re_lu_layer_call_and_return_conditional_losses_102782!
p_re_lu/StatefulPartitionedCallи
-batch_normalization_1/StatefulPartitionedCallStatefulPartitionedCall(p_re_lu/StatefulPartitionedCall:output:0batch_normalization_1_10282batch_normalization_1_10284batch_normalization_1_10286batch_normalization_1_10288*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_1_layer_call_and_return_conditional_losses_96862/
-batch_normalization_1/StatefulPartitionedCallї
dropout_1/PartitionedCallPartitionedCall6batch_normalization_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_1_layer_call_and_return_conditional_losses_102962
dropout_1/PartitionedCall«
dense_1/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense_1_10309dense_1_10311*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_103082!
dense_1/StatefulPartitionedCallФ
!p_re_lu_1/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0p_re_lu_1_10326*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_103252#
!p_re_lu_1/StatefulPartitionedCall╣
-batch_normalization_2/StatefulPartitionedCallStatefulPartitionedCall*p_re_lu_1/StatefulPartitionedCall:output:0batch_normalization_2_10329batch_normalization_2_10331batch_normalization_2_10333batch_normalization_2_10335*
Tin	
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *X
fSRQ
O__inference_batch_normalization_2_layer_call_and_return_conditional_losses_98882/
-batch_normalization_2/StatefulPartitionedCallї
dropout_2/PartitionedCallPartitionedCall6batch_normalization_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         ђ* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_103432
dropout_2/PartitionedCallГ
dense_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense_2_10356dense_2_10358*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_103552!
dense_2/StatefulPartitionedCallф
!p_re_lu_2/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0p_re_lu_2_10373*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*#
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_103722#
!p_re_lu_2/StatefulPartitionedCall╣
-batch_normalization_3/StatefulPartitionedCallStatefulPartitionedCall*p_re_lu_2/StatefulPartitionedCall:output:0batch_normalization_3_10376batch_normalization_3_10378batch_normalization_3_10380batch_normalization_3_10382*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*&
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *Y
fTRR
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_100902/
-batch_normalization_3/StatefulPartitionedCallІ
dropout_3/PartitionedCallPartitionedCall6batch_normalization_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU2*0,1J 8ѓ *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_103902
dropout_3/PartitionedCallГ
dense_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0dense_3_10404dense_3_10406*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*2
config_proto" 

CPU

GPU2*0,1J 8ѓ *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_104032!
dense_3/StatefulPartitionedCallЃ
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         2

IdentityЧ
NoOpNoOp,^batch_normalization/StatefulPartitionedCall.^batch_normalization_1/StatefulPartitionedCall.^batch_normalization_2/StatefulPartitionedCall.^batch_normalization_3/StatefulPartitionedCall^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall ^p_re_lu/StatefulPartitionedCall"^p_re_lu_1/StatefulPartitionedCall"^p_re_lu_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*]
_input_shapesL
J:         ├: : : : : : : : : : : : : : : : : : : : : : : : : : : 2Z
+batch_normalization/StatefulPartitionedCall+batch_normalization/StatefulPartitionedCall2^
-batch_normalization_1/StatefulPartitionedCall-batch_normalization_1/StatefulPartitionedCall2^
-batch_normalization_2/StatefulPartitionedCall-batch_normalization_2/StatefulPartitionedCall2^
-batch_normalization_3/StatefulPartitionedCall-batch_normalization_3/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
p_re_lu/StatefulPartitionedCallp_re_lu/StatefulPartitionedCall2F
!p_re_lu_1/StatefulPartitionedCall!p_re_lu_1/StatefulPartitionedCall2F
!p_re_lu_2/StatefulPartitionedCall!p_re_lu_2/StatefulPartitionedCall:P L
(
_output_shapes
:         ├
 
_user_specified_nameinputs
Юў
│"
__inference__traced_save_12400
file_prefix8
4savev2_batch_normalization_gamma_read_readvariableop7
3savev2_batch_normalization_beta_read_readvariableop>
:savev2_batch_normalization_moving_mean_read_readvariableopB
>savev2_batch_normalization_moving_variance_read_readvariableop+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop,
(savev2_p_re_lu_alpha_read_readvariableop:
6savev2_batch_normalization_1_gamma_read_readvariableop9
5savev2_batch_normalization_1_beta_read_readvariableop@
<savev2_batch_normalization_1_moving_mean_read_readvariableopD
@savev2_batch_normalization_1_moving_variance_read_readvariableop-
)savev2_dense_1_kernel_read_readvariableop+
'savev2_dense_1_bias_read_readvariableop.
*savev2_p_re_lu_1_alpha_read_readvariableop:
6savev2_batch_normalization_2_gamma_read_readvariableop9
5savev2_batch_normalization_2_beta_read_readvariableop@
<savev2_batch_normalization_2_moving_mean_read_readvariableopD
@savev2_batch_normalization_2_moving_variance_read_readvariableop-
)savev2_dense_2_kernel_read_readvariableop+
'savev2_dense_2_bias_read_readvariableop.
*savev2_p_re_lu_2_alpha_read_readvariableop:
6savev2_batch_normalization_3_gamma_read_readvariableop9
5savev2_batch_normalization_3_beta_read_readvariableop@
<savev2_batch_normalization_3_moving_mean_read_readvariableopD
@savev2_batch_normalization_3_moving_variance_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop+
'savev2_dense_3_bias_read_readvariableop)
%savev2_nadam_iter_read_readvariableop	+
'savev2_nadam_beta_1_read_readvariableop+
'savev2_nadam_beta_2_read_readvariableop*
&savev2_nadam_decay_read_readvariableop2
.savev2_nadam_learning_rate_read_readvariableop3
/savev2_nadam_momentum_cache_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop&
"savev2_total_2_read_readvariableop&
"savev2_count_2_read_readvariableop@
<savev2_nadam_batch_normalization_gamma_m_read_readvariableop?
;savev2_nadam_batch_normalization_beta_m_read_readvariableop3
/savev2_nadam_dense_kernel_m_read_readvariableop1
-savev2_nadam_dense_bias_m_read_readvariableop4
0savev2_nadam_p_re_lu_alpha_m_read_readvariableopB
>savev2_nadam_batch_normalization_1_gamma_m_read_readvariableopA
=savev2_nadam_batch_normalization_1_beta_m_read_readvariableop5
1savev2_nadam_dense_1_kernel_m_read_readvariableop3
/savev2_nadam_dense_1_bias_m_read_readvariableop6
2savev2_nadam_p_re_lu_1_alpha_m_read_readvariableopB
>savev2_nadam_batch_normalization_2_gamma_m_read_readvariableopA
=savev2_nadam_batch_normalization_2_beta_m_read_readvariableop5
1savev2_nadam_dense_2_kernel_m_read_readvariableop3
/savev2_nadam_dense_2_bias_m_read_readvariableop6
2savev2_nadam_p_re_lu_2_alpha_m_read_readvariableopB
>savev2_nadam_batch_normalization_3_gamma_m_read_readvariableopA
=savev2_nadam_batch_normalization_3_beta_m_read_readvariableop5
1savev2_nadam_dense_3_kernel_m_read_readvariableop3
/savev2_nadam_dense_3_bias_m_read_readvariableop@
<savev2_nadam_batch_normalization_gamma_v_read_readvariableop?
;savev2_nadam_batch_normalization_beta_v_read_readvariableop3
/savev2_nadam_dense_kernel_v_read_readvariableop1
-savev2_nadam_dense_bias_v_read_readvariableop4
0savev2_nadam_p_re_lu_alpha_v_read_readvariableopB
>savev2_nadam_batch_normalization_1_gamma_v_read_readvariableopA
=savev2_nadam_batch_normalization_1_beta_v_read_readvariableop5
1savev2_nadam_dense_1_kernel_v_read_readvariableop3
/savev2_nadam_dense_1_bias_v_read_readvariableop6
2savev2_nadam_p_re_lu_1_alpha_v_read_readvariableopB
>savev2_nadam_batch_normalization_2_gamma_v_read_readvariableopA
=savev2_nadam_batch_normalization_2_beta_v_read_readvariableop5
1savev2_nadam_dense_2_kernel_v_read_readvariableop3
/savev2_nadam_dense_2_bias_v_read_readvariableop6
2savev2_nadam_p_re_lu_2_alpha_v_read_readvariableopB
>savev2_nadam_batch_normalization_3_gamma_v_read_readvariableopA
=savev2_nadam_batch_normalization_3_beta_v_read_readvariableop5
1savev2_nadam_dense_3_kernel_v_read_readvariableop3
/savev2_nadam_dense_3_bias_v_read_readvariableop
savev2_const

identity_1ѕбMergeV2CheckpointsЈ
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1І
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shardд
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilenameп*
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:N*
dtype0*Ж)
valueЯ)BП)NB5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-0/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-0/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-2/alpha/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-3/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-3/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-3/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-5/alpha/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-6/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-6/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-6/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-8/alpha/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-9/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-9/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-9/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-9/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB7layer_with_weights-10/kernel/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-10/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/momentum_cache/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/2/count/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-0/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-2/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-5/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-6/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-8/alpha/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-10/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-0/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-2/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-3/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-5/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-6/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-8/alpha/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-9/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-9/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBSlayer_with_weights-10/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-10/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_namesД
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:N*
dtype0*▒
valueДBцNB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slicesЏ!
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:04savev2_batch_normalization_gamma_read_readvariableop3savev2_batch_normalization_beta_read_readvariableop:savev2_batch_normalization_moving_mean_read_readvariableop>savev2_batch_normalization_moving_variance_read_readvariableop'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop(savev2_p_re_lu_alpha_read_readvariableop6savev2_batch_normalization_1_gamma_read_readvariableop5savev2_batch_normalization_1_beta_read_readvariableop<savev2_batch_normalization_1_moving_mean_read_readvariableop@savev2_batch_normalization_1_moving_variance_read_readvariableop)savev2_dense_1_kernel_read_readvariableop'savev2_dense_1_bias_read_readvariableop*savev2_p_re_lu_1_alpha_read_readvariableop6savev2_batch_normalization_2_gamma_read_readvariableop5savev2_batch_normalization_2_beta_read_readvariableop<savev2_batch_normalization_2_moving_mean_read_readvariableop@savev2_batch_normalization_2_moving_variance_read_readvariableop)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableop*savev2_p_re_lu_2_alpha_read_readvariableop6savev2_batch_normalization_3_gamma_read_readvariableop5savev2_batch_normalization_3_beta_read_readvariableop<savev2_batch_normalization_3_moving_mean_read_readvariableop@savev2_batch_normalization_3_moving_variance_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableop%savev2_nadam_iter_read_readvariableop'savev2_nadam_beta_1_read_readvariableop'savev2_nadam_beta_2_read_readvariableop&savev2_nadam_decay_read_readvariableop.savev2_nadam_learning_rate_read_readvariableop/savev2_nadam_momentum_cache_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop"savev2_total_2_read_readvariableop"savev2_count_2_read_readvariableop<savev2_nadam_batch_normalization_gamma_m_read_readvariableop;savev2_nadam_batch_normalization_beta_m_read_readvariableop/savev2_nadam_dense_kernel_m_read_readvariableop-savev2_nadam_dense_bias_m_read_readvariableop0savev2_nadam_p_re_lu_alpha_m_read_readvariableop>savev2_nadam_batch_normalization_1_gamma_m_read_readvariableop=savev2_nadam_batch_normalization_1_beta_m_read_readvariableop1savev2_nadam_dense_1_kernel_m_read_readvariableop/savev2_nadam_dense_1_bias_m_read_readvariableop2savev2_nadam_p_re_lu_1_alpha_m_read_readvariableop>savev2_nadam_batch_normalization_2_gamma_m_read_readvariableop=savev2_nadam_batch_normalization_2_beta_m_read_readvariableop1savev2_nadam_dense_2_kernel_m_read_readvariableop/savev2_nadam_dense_2_bias_m_read_readvariableop2savev2_nadam_p_re_lu_2_alpha_m_read_readvariableop>savev2_nadam_batch_normalization_3_gamma_m_read_readvariableop=savev2_nadam_batch_normalization_3_beta_m_read_readvariableop1savev2_nadam_dense_3_kernel_m_read_readvariableop/savev2_nadam_dense_3_bias_m_read_readvariableop<savev2_nadam_batch_normalization_gamma_v_read_readvariableop;savev2_nadam_batch_normalization_beta_v_read_readvariableop/savev2_nadam_dense_kernel_v_read_readvariableop-savev2_nadam_dense_bias_v_read_readvariableop0savev2_nadam_p_re_lu_alpha_v_read_readvariableop>savev2_nadam_batch_normalization_1_gamma_v_read_readvariableop=savev2_nadam_batch_normalization_1_beta_v_read_readvariableop1savev2_nadam_dense_1_kernel_v_read_readvariableop/savev2_nadam_dense_1_bias_v_read_readvariableop2savev2_nadam_p_re_lu_1_alpha_v_read_readvariableop>savev2_nadam_batch_normalization_2_gamma_v_read_readvariableop=savev2_nadam_batch_normalization_2_beta_v_read_readvariableop1savev2_nadam_dense_2_kernel_v_read_readvariableop/savev2_nadam_dense_2_bias_v_read_readvariableop2savev2_nadam_p_re_lu_2_alpha_v_read_readvariableop>savev2_nadam_batch_normalization_3_gamma_v_read_readvariableop=savev2_nadam_batch_normalization_3_beta_v_read_readvariableop1savev2_nadam_dense_3_kernel_v_read_readvariableop/savev2_nadam_dense_3_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *\
dtypesR
P2N	2
SaveV2║
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixesА
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: 2

Identity_1c
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"!

identity_1Identity_1:output:0*џ
_input_shapesѕ
Ё: :├:├:├:├:
├ђ:ђ:ђ:ђ:ђ:ђ:ђ:
ђђ:ђ:ђ:ђ:ђ:ђ:ђ:	ђ@:@:@:@:@:@:@:@:: : : : : : : : : : : : :├:├:
├ђ:ђ:ђ:ђ:ђ:
ђђ:ђ:ђ:ђ:ђ:	ђ@:@:@:@:@:@::├:├:
├ђ:ђ:ђ:ђ:ђ:
ђђ:ђ:ђ:ђ:ђ:	ђ@:@:@:@:@:@:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:!

_output_shapes	
:├:!

_output_shapes	
:├:!

_output_shapes	
:├:!

_output_shapes	
:├:&"
 
_output_shapes
:
├ђ:!

_output_shapes	
:ђ:!

_output_shapes	
:ђ:!

_output_shapes	
:ђ:!	

_output_shapes	
:ђ:!


_output_shapes	
:ђ:!

_output_shapes	
:ђ:&"
 
_output_shapes
:
ђђ:!

_output_shapes	
:ђ:!

_output_shapes	
:ђ:!

_output_shapes	
:ђ:!

_output_shapes	
:ђ:!

_output_shapes	
:ђ:!

_output_shapes	
:ђ:%!

_output_shapes
:	ђ@: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@:$ 

_output_shapes

:@: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: : 

_output_shapes
: :!

_output_shapes
: :"

_output_shapes
: :#

_output_shapes
: :$

_output_shapes
: :%

_output_shapes
: :&

_output_shapes
: :'

_output_shapes
: :!(

_output_shapes	
:├:!)

_output_shapes	
:├:&*"
 
_output_shapes
:
├ђ:!+

_output_shapes	
:ђ:!,

_output_shapes	
:ђ:!-

_output_shapes	
:ђ:!.

_output_shapes	
:ђ:&/"
 
_output_shapes
:
ђђ:!0

_output_shapes	
:ђ:!1

_output_shapes	
:ђ:!2

_output_shapes	
:ђ:!3

_output_shapes	
:ђ:%4!

_output_shapes
:	ђ@: 5

_output_shapes
:@: 6

_output_shapes
:@: 7

_output_shapes
:@: 8

_output_shapes
:@:$9 

_output_shapes

:@: :

_output_shapes
::!;

_output_shapes	
:├:!<

_output_shapes	
:├:&="
 
_output_shapes
:
├ђ:!>

_output_shapes	
:ђ:!?

_output_shapes	
:ђ:!@

_output_shapes	
:ђ:!A

_output_shapes	
:ђ:&B"
 
_output_shapes
:
ђђ:!C

_output_shapes	
:ђ:!D

_output_shapes	
:ђ:!E

_output_shapes	
:ђ:!F

_output_shapes	
:ђ:%G!

_output_shapes
:	ђ@: H

_output_shapes
:@: I

_output_shapes
:@: J

_output_shapes
:@: K

_output_shapes
:@:$L 

_output_shapes

:@: M

_output_shapes
::N

_output_shapes
: 
ш
b
D__inference_dropout_2_layer_call_and_return_conditional_losses_10343

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:         ђ2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:         ђ2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
│
c
D__inference_dropout_1_layer_call_and_return_conditional_losses_10577

inputs
identityѕc
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:         ђ2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shapeх
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:         ђ*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>2
dropout/GreaterEqual/y┐
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:         ђ2
dropout/GreaterEqualђ
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:         ђ2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:         ђ2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:         ђ2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         ђ:P L
(
_output_shapes
:         ђ
 
_user_specified_nameinputs
Ђ

Џ
C__inference_p_re_lu_1_layer_call_and_return_conditional_losses_9840

inputs&
readvariableop_resource:	ђ
identityѕбReadVariableOpW
ReluReluinputs*
T0*0
_output_shapes
:                  2
Reluu
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes	
:ђ*
dtype02
ReadVariableOpO
NegNegReadVariableOp:value:0*
T0*
_output_shapes	
:ђ2
NegX
Neg_1Neginputs*
T0*0
_output_shapes
:                  2
Neg_1^
Relu_1Relu	Neg_1:y:0*
T0*0
_output_shapes
:                  2
Relu_1c
mulMulNeg:y:0Relu_1:activations:0*
T0*(
_output_shapes
:         ђ2
mulc
addAddV2Relu:activations:0mul:z:0*
T0*(
_output_shapes
:         ђ2
addc
IdentityIdentityadd:z:0^NoOp*
T0*(
_output_shapes
:         ђ2

Identity_
NoOpNoOp^ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*1
_input_shapes 
:                  : 2 
ReadVariableOpReadVariableOp:X T
0
_output_shapes
:                  
 
_user_specified_nameinputs
З
»
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_12039

inputs/
!batchnorm_readvariableop_resource:@3
%batchnorm_mul_readvariableop_resource:@1
#batchnorm_readvariableop_1_resource:@1
#batchnorm_readvariableop_2_resource:@
identityѕбbatchnorm/ReadVariableOpбbatchnorm/ReadVariableOp_1бbatchnorm/ReadVariableOp_2бbatchnorm/mul/ReadVariableOpњ
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *oЃ:2
batchnorm/add/yѕ
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@2
batchnorm/addc
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@2
batchnorm/Rsqrtъ
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/mul/ReadVariableOpЁ
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
batchnorm/mulv
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:         @2
batchnorm/mul_1ў
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp_1Ё
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:@2
batchnorm/mul_2ў
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp_2Ѓ
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2
batchnorm/subЁ
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:         @2
batchnorm/add_1n
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:         @2

Identity┬
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:         @: : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
ы
b
D__inference_dropout_3_layer_call_and_return_conditional_losses_12104

inputs

identity_1Z
IdentityIdentityinputs*
T0*'
_output_shapes
:         @2

Identityi

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:         @2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs"еL
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ф
serving_defaultЌ
<
input_11
serving_default_input_1:0         ├;
dense_30
StatefulPartitionedCall:0         tensorflow/serving/predict:њД
л
layer_with_weights-0
layer-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
layer_with_weights-3
layer-4
layer-5
layer_with_weights-4
layer-6
layer_with_weights-5
layer-7
	layer_with_weights-6
	layer-8

layer-9
layer_with_weights-7
layer-10
layer_with_weights-8
layer-11
layer_with_weights-9
layer-12
layer-13
layer_with_weights-10
layer-14
	optimizer
trainable_variables
regularization_losses
	variables
	keras_api

signatures
§_default_save_signature
+■&call_and_return_all_conditional_losses
 __call__"
_tf_keras_sequential
В
axis
	gamma
beta
moving_mean
moving_variance
trainable_variables
regularization_losses
	variables
	keras_api
+ђ&call_and_return_all_conditional_losses
Ђ__call__"
_tf_keras_layer
Д
trainable_variables
 regularization_losses
!	variables
"	keras_api
+ѓ&call_and_return_all_conditional_losses
Ѓ__call__"
_tf_keras_layer
й

#kernel
$bias
%trainable_variables
&regularization_losses
'	variables
(	keras_api
+ё&call_and_return_all_conditional_losses
Ё__call__"
_tf_keras_layer
▓
	)alpha
*trainable_variables
+regularization_losses
,	variables
-	keras_api
+є&call_and_return_all_conditional_losses
Є__call__"
_tf_keras_layer
В
.axis
	/gamma
0beta
1moving_mean
2moving_variance
3trainable_variables
4regularization_losses
5	variables
6	keras_api
+ѕ&call_and_return_all_conditional_losses
Ѕ__call__"
_tf_keras_layer
Д
7trainable_variables
8regularization_losses
9	variables
:	keras_api
+і&call_and_return_all_conditional_losses
І__call__"
_tf_keras_layer
й

;kernel
<bias
=trainable_variables
>regularization_losses
?	variables
@	keras_api
+ї&call_and_return_all_conditional_losses
Ї__call__"
_tf_keras_layer
▓
	Aalpha
Btrainable_variables
Cregularization_losses
D	variables
E	keras_api
+ј&call_and_return_all_conditional_losses
Ј__call__"
_tf_keras_layer
В
Faxis
	Ggamma
Hbeta
Imoving_mean
Jmoving_variance
Ktrainable_variables
Lregularization_losses
M	variables
N	keras_api
+љ&call_and_return_all_conditional_losses
Љ__call__"
_tf_keras_layer
Д
Otrainable_variables
Pregularization_losses
Q	variables
R	keras_api
+њ&call_and_return_all_conditional_losses
Њ__call__"
_tf_keras_layer
й

Skernel
Tbias
Utrainable_variables
Vregularization_losses
W	variables
X	keras_api
+ћ&call_and_return_all_conditional_losses
Ћ__call__"
_tf_keras_layer
▓
	Yalpha
Ztrainable_variables
[regularization_losses
\	variables
]	keras_api
+ќ&call_and_return_all_conditional_losses
Ќ__call__"
_tf_keras_layer
В
^axis
	_gamma
`beta
amoving_mean
bmoving_variance
ctrainable_variables
dregularization_losses
e	variables
f	keras_api
+ў&call_and_return_all_conditional_losses
Ў__call__"
_tf_keras_layer
Д
gtrainable_variables
hregularization_losses
i	variables
j	keras_api
+џ&call_and_return_all_conditional_losses
Џ__call__"
_tf_keras_layer
й

kkernel
lbias
mtrainable_variables
nregularization_losses
o	variables
p	keras_api
+ю&call_and_return_all_conditional_losses
Ю__call__"
_tf_keras_layer
с
qiter

rbeta_1

sbeta_2
	tdecay
ulearning_rate
vmomentum_cachemОmп#m┘$m┌)m█/m▄0mП;mя<m▀AmЯGmрHmРSmсTmСYmт_mТ`mуkmУlmжvЖvв#vВ$vь)vЬ/v№0v­;vы<vЫAvзGvЗHvшSvШTvэYvЭ_vщ`vЩkvчlvЧ"
	optimizer
«
0
1
#2
$3
)4
/5
06
;7
<8
A9
G10
H11
S12
T13
Y14
_15
`16
k17
l18"
trackable_list_wrapper
 "
trackable_list_wrapper
Ь
0
1
2
3
#4
$5
)6
/7
08
19
210
;11
<12
A13
G14
H15
I16
J17
S18
T19
Y20
_21
`22
a23
b24
k25
l26"
trackable_list_wrapper
╬

wlayers
trainable_variables
xnon_trainable_variables
regularization_losses
	variables
ylayer_regularization_losses
zmetrics
{layer_metrics
 __call__
§_default_save_signature
+■&call_and_return_all_conditional_losses
'■"call_and_return_conditional_losses"
_generic_user_object
-
ъserving_default"
signature_map
 "
trackable_list_wrapper
(:&├2batch_normalization/gamma
':%├2batch_normalization/beta
0:.├ (2batch_normalization/moving_mean
4:2├ (2#batch_normalization/moving_variance
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
▒

|layers
trainable_variables
}non_trainable_variables
regularization_losses
	variables
~layer_regularization_losses
metrics
ђlayer_metrics
Ђ__call__
+ђ&call_and_return_all_conditional_losses
'ђ"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
х
Ђlayers
trainable_variables
ѓnon_trainable_variables
 regularization_losses
!	variables
 Ѓlayer_regularization_losses
ёmetrics
Ёlayer_metrics
Ѓ__call__
+ѓ&call_and_return_all_conditional_losses
'ѓ"call_and_return_conditional_losses"
_generic_user_object
 :
├ђ2dense/kernel
:ђ2
dense/bias
.
#0
$1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
#0
$1"
trackable_list_wrapper
х
єlayers
%trainable_variables
Єnon_trainable_variables
&regularization_losses
'	variables
 ѕlayer_regularization_losses
Ѕmetrics
іlayer_metrics
Ё__call__
+ё&call_and_return_all_conditional_losses
'ё"call_and_return_conditional_losses"
_generic_user_object
:ђ2p_re_lu/alpha
'
)0"
trackable_list_wrapper
 "
trackable_list_wrapper
'
)0"
trackable_list_wrapper
х
Іlayers
*trainable_variables
їnon_trainable_variables
+regularization_losses
,	variables
 Їlayer_regularization_losses
јmetrics
Јlayer_metrics
Є__call__
+є&call_and_return_all_conditional_losses
'є"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
*:(ђ2batch_normalization_1/gamma
):'ђ2batch_normalization_1/beta
2:0ђ (2!batch_normalization_1/moving_mean
6:4ђ (2%batch_normalization_1/moving_variance
.
/0
01"
trackable_list_wrapper
 "
trackable_list_wrapper
<
/0
01
12
23"
trackable_list_wrapper
х
љlayers
3trainable_variables
Љnon_trainable_variables
4regularization_losses
5	variables
 њlayer_regularization_losses
Њmetrics
ћlayer_metrics
Ѕ__call__
+ѕ&call_and_return_all_conditional_losses
'ѕ"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
х
Ћlayers
7trainable_variables
ќnon_trainable_variables
8regularization_losses
9	variables
 Ќlayer_regularization_losses
ўmetrics
Ўlayer_metrics
І__call__
+і&call_and_return_all_conditional_losses
'і"call_and_return_conditional_losses"
_generic_user_object
": 
ђђ2dense_1/kernel
:ђ2dense_1/bias
.
;0
<1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
;0
<1"
trackable_list_wrapper
х
џlayers
=trainable_variables
Џnon_trainable_variables
>regularization_losses
?	variables
 юlayer_regularization_losses
Юmetrics
ъlayer_metrics
Ї__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses"
_generic_user_object
:ђ2p_re_lu_1/alpha
'
A0"
trackable_list_wrapper
 "
trackable_list_wrapper
'
A0"
trackable_list_wrapper
х
Ъlayers
Btrainable_variables
аnon_trainable_variables
Cregularization_losses
D	variables
 Аlayer_regularization_losses
бmetrics
Бlayer_metrics
Ј__call__
+ј&call_and_return_all_conditional_losses
'ј"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
*:(ђ2batch_normalization_2/gamma
):'ђ2batch_normalization_2/beta
2:0ђ (2!batch_normalization_2/moving_mean
6:4ђ (2%batch_normalization_2/moving_variance
.
G0
H1"
trackable_list_wrapper
 "
trackable_list_wrapper
<
G0
H1
I2
J3"
trackable_list_wrapper
х
цlayers
Ktrainable_variables
Цnon_trainable_variables
Lregularization_losses
M	variables
 дlayer_regularization_losses
Дmetrics
еlayer_metrics
Љ__call__
+љ&call_and_return_all_conditional_losses
'љ"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
х
Еlayers
Otrainable_variables
фnon_trainable_variables
Pregularization_losses
Q	variables
 Фlayer_regularization_losses
гmetrics
Гlayer_metrics
Њ__call__
+њ&call_and_return_all_conditional_losses
'њ"call_and_return_conditional_losses"
_generic_user_object
!:	ђ@2dense_2/kernel
:@2dense_2/bias
.
S0
T1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
S0
T1"
trackable_list_wrapper
х
«layers
Utrainable_variables
»non_trainable_variables
Vregularization_losses
W	variables
 ░layer_regularization_losses
▒metrics
▓layer_metrics
Ћ__call__
+ћ&call_and_return_all_conditional_losses
'ћ"call_and_return_conditional_losses"
_generic_user_object
:@2p_re_lu_2/alpha
'
Y0"
trackable_list_wrapper
 "
trackable_list_wrapper
'
Y0"
trackable_list_wrapper
х
│layers
Ztrainable_variables
┤non_trainable_variables
[regularization_losses
\	variables
 хlayer_regularization_losses
Хmetrics
иlayer_metrics
Ќ__call__
+ќ&call_and_return_all_conditional_losses
'ќ"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
):'@2batch_normalization_3/gamma
(:&@2batch_normalization_3/beta
1:/@ (2!batch_normalization_3/moving_mean
5:3@ (2%batch_normalization_3/moving_variance
.
_0
`1"
trackable_list_wrapper
 "
trackable_list_wrapper
<
_0
`1
a2
b3"
trackable_list_wrapper
х
Иlayers
ctrainable_variables
╣non_trainable_variables
dregularization_losses
e	variables
 ║layer_regularization_losses
╗metrics
╝layer_metrics
Ў__call__
+ў&call_and_return_all_conditional_losses
'ў"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
х
йlayers
gtrainable_variables
Йnon_trainable_variables
hregularization_losses
i	variables
 ┐layer_regularization_losses
└metrics
┴layer_metrics
Џ__call__
+џ&call_and_return_all_conditional_losses
'џ"call_and_return_conditional_losses"
_generic_user_object
 :@2dense_3/kernel
:2dense_3/bias
.
k0
l1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
k0
l1"
trackable_list_wrapper
х
┬layers
mtrainable_variables
├non_trainable_variables
nregularization_losses
o	variables
 ─layer_regularization_losses
┼metrics
кlayer_metrics
Ю__call__
+ю&call_and_return_all_conditional_losses
'ю"call_and_return_conditional_losses"
_generic_user_object
:	 (2
Nadam/iter
: (2Nadam/beta_1
: (2Nadam/beta_2
: (2Nadam/decay
: (2Nadam/learning_rate
: (2Nadam/momentum_cache
ј
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14"
trackable_list_wrapper
X
0
1
12
23
I4
J5
a6
b7"
trackable_list_wrapper
 "
trackable_list_wrapper
8
К0
╚1
╔2"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
10
21"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
I0
J1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
a0
b1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
R

╩total

╦count
╠	variables
═	keras_api"
_tf_keras_metric
R

╬total

¤count
л	variables
Л	keras_api"
_tf_keras_metric
c

мtotal

Мcount
н
_fn_kwargs
Н	variables
о	keras_api"
_tf_keras_metric
:  (2total
:  (2count
0
╩0
╦1"
trackable_list_wrapper
.
╠	variables"
_generic_user_object
:  (2total
:  (2count
0
╬0
¤1"
trackable_list_wrapper
.
л	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
0
м0
М1"
trackable_list_wrapper
.
Н	variables"
_generic_user_object
.:,├2!Nadam/batch_normalization/gamma/m
-:+├2 Nadam/batch_normalization/beta/m
&:$
├ђ2Nadam/dense/kernel/m
:ђ2Nadam/dense/bias/m
": ђ2Nadam/p_re_lu/alpha/m
0:.ђ2#Nadam/batch_normalization_1/gamma/m
/:-ђ2"Nadam/batch_normalization_1/beta/m
(:&
ђђ2Nadam/dense_1/kernel/m
!:ђ2Nadam/dense_1/bias/m
$:"ђ2Nadam/p_re_lu_1/alpha/m
0:.ђ2#Nadam/batch_normalization_2/gamma/m
/:-ђ2"Nadam/batch_normalization_2/beta/m
':%	ђ@2Nadam/dense_2/kernel/m
 :@2Nadam/dense_2/bias/m
#:!@2Nadam/p_re_lu_2/alpha/m
/:-@2#Nadam/batch_normalization_3/gamma/m
.:,@2"Nadam/batch_normalization_3/beta/m
&:$@2Nadam/dense_3/kernel/m
 :2Nadam/dense_3/bias/m
.:,├2!Nadam/batch_normalization/gamma/v
-:+├2 Nadam/batch_normalization/beta/v
&:$
├ђ2Nadam/dense/kernel/v
:ђ2Nadam/dense/bias/v
": ђ2Nadam/p_re_lu/alpha/v
0:.ђ2#Nadam/batch_normalization_1/gamma/v
/:-ђ2"Nadam/batch_normalization_1/beta/v
(:&
ђђ2Nadam/dense_1/kernel/v
!:ђ2Nadam/dense_1/bias/v
$:"ђ2Nadam/p_re_lu_1/alpha/v
0:.ђ2#Nadam/batch_normalization_2/gamma/v
/:-ђ2"Nadam/batch_normalization_2/beta/v
':%	ђ@2Nadam/dense_2/kernel/v
 :@2Nadam/dense_2/bias/v
#:!@2Nadam/p_re_lu_2/alpha/v
/:-@2#Nadam/batch_normalization_3/gamma/v
.:,@2"Nadam/batch_normalization_3/beta/v
&:$@2Nadam/dense_3/kernel/v
 :2Nadam/dense_3/bias/v
╩BК
__inference__wrapped_model_9460input_1"ў
Љ▓Ї
FullArgSpec
argsџ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Р2▀
E__inference_sequential_layer_call_and_return_conditional_losses_11204
E__inference_sequential_layer_call_and_return_conditional_losses_11409
E__inference_sequential_layer_call_and_return_conditional_losses_10943
E__inference_sequential_layer_call_and_return_conditional_losses_11016└
и▓│
FullArgSpec1
args)џ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsџ
p 

 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
Ш2з
*__inference_sequential_layer_call_fn_10467
*__inference_sequential_layer_call_fn_11468
*__inference_sequential_layer_call_fn_11527
*__inference_sequential_layer_call_fn_10870└
и▓│
FullArgSpec1
args)џ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsџ
p 

 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
┌2О
N__inference_batch_normalization_layer_call_and_return_conditional_losses_11547
N__inference_batch_normalization_layer_call_and_return_conditional_losses_11581┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
ц2А
3__inference_batch_normalization_layer_call_fn_11594
3__inference_batch_normalization_layer_call_fn_11607┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
┬2┐
B__inference_dropout_layer_call_and_return_conditional_losses_11612
B__inference_dropout_layer_call_and_return_conditional_losses_11624┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
ї2Ѕ
'__inference_dropout_layer_call_fn_11629
'__inference_dropout_layer_call_fn_11634┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
Ж2у
@__inference_dense_layer_call_and_return_conditional_losses_11644б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
¤2╠
%__inference_dense_layer_call_fn_11653б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
░2Г
B__inference_p_re_lu_layer_call_and_return_conditional_losses_11665
B__inference_p_re_lu_layer_call_and_return_conditional_losses_11677б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Щ2э
'__inference_p_re_lu_layer_call_fn_11684
'__inference_p_re_lu_layer_call_fn_11691б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
я2█
P__inference_batch_normalization_1_layer_call_and_return_conditional_losses_11711
P__inference_batch_normalization_1_layer_call_and_return_conditional_losses_11745┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
е2Ц
5__inference_batch_normalization_1_layer_call_fn_11758
5__inference_batch_normalization_1_layer_call_fn_11771┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
к2├
D__inference_dropout_1_layer_call_and_return_conditional_losses_11776
D__inference_dropout_1_layer_call_and_return_conditional_losses_11788┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
љ2Ї
)__inference_dropout_1_layer_call_fn_11793
)__inference_dropout_1_layer_call_fn_11798┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
В2ж
B__inference_dense_1_layer_call_and_return_conditional_losses_11808б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Л2╬
'__inference_dense_1_layer_call_fn_11817б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
┤2▒
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_11829
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_11841б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
■2ч
)__inference_p_re_lu_1_layer_call_fn_11848
)__inference_p_re_lu_1_layer_call_fn_11855б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
я2█
P__inference_batch_normalization_2_layer_call_and_return_conditional_losses_11875
P__inference_batch_normalization_2_layer_call_and_return_conditional_losses_11909┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
е2Ц
5__inference_batch_normalization_2_layer_call_fn_11922
5__inference_batch_normalization_2_layer_call_fn_11935┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
к2├
D__inference_dropout_2_layer_call_and_return_conditional_losses_11940
D__inference_dropout_2_layer_call_and_return_conditional_losses_11952┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
љ2Ї
)__inference_dropout_2_layer_call_fn_11957
)__inference_dropout_2_layer_call_fn_11962┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
В2ж
B__inference_dense_2_layer_call_and_return_conditional_losses_11972б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Л2╬
'__inference_dense_2_layer_call_fn_11981б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
┤2▒
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_11993
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_12005б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
■2ч
)__inference_p_re_lu_2_layer_call_fn_12012
)__inference_p_re_lu_2_layer_call_fn_12019б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
я2█
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_12039
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_12073┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
е2Ц
5__inference_batch_normalization_3_layer_call_fn_12086
5__inference_batch_normalization_3_layer_call_fn_12099┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
к2├
D__inference_dropout_3_layer_call_and_return_conditional_losses_12104
D__inference_dropout_3_layer_call_and_return_conditional_losses_12116┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
љ2Ї
)__inference_dropout_3_layer_call_fn_12121
)__inference_dropout_3_layer_call_fn_12126┤
Ф▓Д
FullArgSpec)
args!џ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsџ
p 

kwonlyargsџ 
kwonlydefaultsф 
annotationsф *
 
В2ж
B__inference_dense_3_layer_call_and_return_conditional_losses_12137б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
Л2╬
'__inference_dense_3_layer_call_fn_12146б
Ў▓Ћ
FullArgSpec
argsџ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 
╩BК
#__inference_signature_wrapper_11083input_1"ћ
Ї▓Ѕ
FullArgSpec
argsџ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsџ 
kwonlydefaults
 
annotationsф *
 Д
__inference__wrapped_model_9460Ѓ#$)2/10;<AJGIHSTYb_a`kl1б.
'б$
"і
input_1         ├
ф "1ф.
,
dense_3!і
dense_3         И
P__inference_batch_normalization_1_layer_call_and_return_conditional_losses_11711d2/104б1
*б'
!і
inputs         ђ
p 
ф "&б#
і
0         ђ
џ И
P__inference_batch_normalization_1_layer_call_and_return_conditional_losses_11745d12/04б1
*б'
!і
inputs         ђ
p
ф "&б#
і
0         ђ
џ љ
5__inference_batch_normalization_1_layer_call_fn_11758W2/104б1
*б'
!і
inputs         ђ
p 
ф "і         ђљ
5__inference_batch_normalization_1_layer_call_fn_11771W12/04б1
*б'
!і
inputs         ђ
p
ф "і         ђИ
P__inference_batch_normalization_2_layer_call_and_return_conditional_losses_11875dJGIH4б1
*б'
!і
inputs         ђ
p 
ф "&б#
і
0         ђ
џ И
P__inference_batch_normalization_2_layer_call_and_return_conditional_losses_11909dIJGH4б1
*б'
!і
inputs         ђ
p
ф "&б#
і
0         ђ
џ љ
5__inference_batch_normalization_2_layer_call_fn_11922WJGIH4б1
*б'
!і
inputs         ђ
p 
ф "і         ђљ
5__inference_batch_normalization_2_layer_call_fn_11935WIJGH4б1
*б'
!і
inputs         ђ
p
ф "і         ђХ
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_12039bb_a`3б0
)б&
 і
inputs         @
p 
ф "%б"
і
0         @
џ Х
P__inference_batch_normalization_3_layer_call_and_return_conditional_losses_12073bab_`3б0
)б&
 і
inputs         @
p
ф "%б"
і
0         @
џ ј
5__inference_batch_normalization_3_layer_call_fn_12086Ub_a`3б0
)б&
 і
inputs         @
p 
ф "і         @ј
5__inference_batch_normalization_3_layer_call_fn_12099Uab_`3б0
)б&
 і
inputs         @
p
ф "і         @Х
N__inference_batch_normalization_layer_call_and_return_conditional_losses_11547d4б1
*б'
!і
inputs         ├
p 
ф "&б#
і
0         ├
џ Х
N__inference_batch_normalization_layer_call_and_return_conditional_losses_11581d4б1
*б'
!і
inputs         ├
p
ф "&б#
і
0         ├
џ ј
3__inference_batch_normalization_layer_call_fn_11594W4б1
*б'
!і
inputs         ├
p 
ф "і         ├ј
3__inference_batch_normalization_layer_call_fn_11607W4б1
*б'
!і
inputs         ├
p
ф "і         ├ц
B__inference_dense_1_layer_call_and_return_conditional_losses_11808^;<0б-
&б#
!і
inputs         ђ
ф "&б#
і
0         ђ
џ |
'__inference_dense_1_layer_call_fn_11817Q;<0б-
&б#
!і
inputs         ђ
ф "і         ђБ
B__inference_dense_2_layer_call_and_return_conditional_losses_11972]ST0б-
&б#
!і
inputs         ђ
ф "%б"
і
0         @
џ {
'__inference_dense_2_layer_call_fn_11981PST0б-
&б#
!і
inputs         ђ
ф "і         @б
B__inference_dense_3_layer_call_and_return_conditional_losses_12137\kl/б,
%б"
 і
inputs         @
ф "%б"
і
0         
џ z
'__inference_dense_3_layer_call_fn_12146Okl/б,
%б"
 і
inputs         @
ф "і         б
@__inference_dense_layer_call_and_return_conditional_losses_11644^#$0б-
&б#
!і
inputs         ├
ф "&б#
і
0         ђ
џ z
%__inference_dense_layer_call_fn_11653Q#$0б-
&б#
!і
inputs         ├
ф "і         ђд
D__inference_dropout_1_layer_call_and_return_conditional_losses_11776^4б1
*б'
!і
inputs         ђ
p 
ф "&б#
і
0         ђ
џ д
D__inference_dropout_1_layer_call_and_return_conditional_losses_11788^4б1
*б'
!і
inputs         ђ
p
ф "&б#
і
0         ђ
џ ~
)__inference_dropout_1_layer_call_fn_11793Q4б1
*б'
!і
inputs         ђ
p 
ф "і         ђ~
)__inference_dropout_1_layer_call_fn_11798Q4б1
*б'
!і
inputs         ђ
p
ф "і         ђд
D__inference_dropout_2_layer_call_and_return_conditional_losses_11940^4б1
*б'
!і
inputs         ђ
p 
ф "&б#
і
0         ђ
џ д
D__inference_dropout_2_layer_call_and_return_conditional_losses_11952^4б1
*б'
!і
inputs         ђ
p
ф "&б#
і
0         ђ
џ ~
)__inference_dropout_2_layer_call_fn_11957Q4б1
*б'
!і
inputs         ђ
p 
ф "і         ђ~
)__inference_dropout_2_layer_call_fn_11962Q4б1
*б'
!і
inputs         ђ
p
ф "і         ђц
D__inference_dropout_3_layer_call_and_return_conditional_losses_12104\3б0
)б&
 і
inputs         @
p 
ф "%б"
і
0         @
џ ц
D__inference_dropout_3_layer_call_and_return_conditional_losses_12116\3б0
)б&
 і
inputs         @
p
ф "%б"
і
0         @
џ |
)__inference_dropout_3_layer_call_fn_12121O3б0
)б&
 і
inputs         @
p 
ф "і         @|
)__inference_dropout_3_layer_call_fn_12126O3б0
)б&
 і
inputs         @
p
ф "і         @ц
B__inference_dropout_layer_call_and_return_conditional_losses_11612^4б1
*б'
!і
inputs         ├
p 
ф "&б#
і
0         ├
џ ц
B__inference_dropout_layer_call_and_return_conditional_losses_11624^4б1
*б'
!і
inputs         ├
p
ф "&б#
і
0         ├
џ |
'__inference_dropout_layer_call_fn_11629Q4б1
*б'
!і
inputs         ├
p 
ф "і         ├|
'__inference_dropout_layer_call_fn_11634Q4б1
*б'
!і
inputs         ├
p
ф "і         ├Г
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_11829eA8б5
.б+
)і&
inputs                  
ф "&б#
і
0         ђ
џ Ц
D__inference_p_re_lu_1_layer_call_and_return_conditional_losses_11841]A0б-
&б#
!і
inputs         ђ
ф "&б#
і
0         ђ
џ Ё
)__inference_p_re_lu_1_layer_call_fn_11848XA8б5
.б+
)і&
inputs                  
ф "і         ђ}
)__inference_p_re_lu_1_layer_call_fn_11855PA0б-
&б#
!і
inputs         ђ
ф "і         ђг
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_11993dY8б5
.б+
)і&
inputs                  
ф "%б"
і
0         @
џ Б
D__inference_p_re_lu_2_layer_call_and_return_conditional_losses_12005[Y/б,
%б"
 і
inputs         @
ф "%б"
і
0         @
џ ё
)__inference_p_re_lu_2_layer_call_fn_12012WY8б5
.б+
)і&
inputs                  
ф "і         @{
)__inference_p_re_lu_2_layer_call_fn_12019NY/б,
%б"
 і
inputs         @
ф "і         @Ф
B__inference_p_re_lu_layer_call_and_return_conditional_losses_11665e)8б5
.б+
)і&
inputs                  
ф "&б#
і
0         ђ
џ Б
B__inference_p_re_lu_layer_call_and_return_conditional_losses_11677])0б-
&б#
!і
inputs         ђ
ф "&б#
і
0         ђ
џ Ѓ
'__inference_p_re_lu_layer_call_fn_11684X)8б5
.б+
)і&
inputs                  
ф "і         ђ{
'__inference_p_re_lu_layer_call_fn_11691P)0б-
&б#
!і
inputs         ђ
ф "і         ђ╚
E__inference_sequential_layer_call_and_return_conditional_losses_10943#$)2/10;<AJGIHSTYb_a`kl9б6
/б,
"і
input_1         ├
p 

 
ф "%б"
і
0         
џ ╚
E__inference_sequential_layer_call_and_return_conditional_losses_11016#$)12/0;<AIJGHSTYab_`kl9б6
/б,
"і
input_1         ├
p

 
ф "%б"
і
0         
џ К
E__inference_sequential_layer_call_and_return_conditional_losses_11204~#$)2/10;<AJGIHSTYb_a`kl8б5
.б+
!і
inputs         ├
p 

 
ф "%б"
і
0         
џ К
E__inference_sequential_layer_call_and_return_conditional_losses_11409~#$)12/0;<AIJGHSTYab_`kl8б5
.б+
!і
inputs         ├
p

 
ф "%б"
і
0         
џ а
*__inference_sequential_layer_call_fn_10467r#$)2/10;<AJGIHSTYb_a`kl9б6
/б,
"і
input_1         ├
p 

 
ф "і         а
*__inference_sequential_layer_call_fn_10870r#$)12/0;<AIJGHSTYab_`kl9б6
/б,
"і
input_1         ├
p

 
ф "і         Ъ
*__inference_sequential_layer_call_fn_11468q#$)2/10;<AJGIHSTYb_a`kl8б5
.б+
!і
inputs         ├
p 

 
ф "і         Ъ
*__inference_sequential_layer_call_fn_11527q#$)12/0;<AIJGHSTYab_`kl8б5
.б+
!і
inputs         ├
p

 
ф "і         Х
#__inference_signature_wrapper_11083ј#$)2/10;<AJGIHSTYb_a`kl<б9
б 
2ф/
-
input_1"і
input_1         ├"1ф.
,
dense_3!і
dense_3         