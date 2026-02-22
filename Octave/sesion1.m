>> v=[1,2,3]
v =

   1   2   3

>> >> v=[1,2,3]
v =

   1   2   3

>> v=
error: syntax error

>>> v=
     ^
>> v=
error: syntax error

>>> v=
     ^
>> v=[1;2;3]
v =

   1
   2
   3

>> format compact
>> v=[1;2;3]
v =
   1
   2
   3

>> 
>> 
>> ans
>> v'
ans =
   1   2   3

>> v=[1:10,1]
v =
    1    2    3    4    5    6    7    8    9   10    1

>> v=[1,10,1]
v =
    1   10    1

>> v=[1:2:10]
v =
   1   3   5   7   9

>> v=[2:2:10]
v =
    2    4    6    8   10

>> v=linspace(1,10,10)
v =
    1    2    3    4    5    6    7    8    9   10

>> v=linspace(1,10,4)
v =
    1    4    7   10

>> v=linspace(1,10,3)
v =
    1.0000    5.5000   10.0000

>> v=linspace(1,10,2)
v =
    1   10

>> v=linspace(1,10,1)
v = 10
>> v=linspace(1,10,90)
v =
 Columns 1 through 10:
    1.0000    1.1011    1.2022    1.3034    1.4045    1.5056    1.6067    1.7079    1.8090    1.9101
 Columns 11 through 20:
    2.0112    2.1124    2.2135    2.3146    2.4157    2.5169    2.6180    2.7191    2.8202    2.9213
 Columns 21 through 30:
    3.0225    3.1236    3.2247    3.3258    3.4270    3.5281    3.6292    3.7303    3.8315    3.9326
 Columns 31 through 40:
    4.0337    4.1348    4.2360    4.3371    4.4382    4.5393    4.6404    4.7416    4.8427    4.9438
 Columns 41 through 50:
    5.0449    5.1461    5.2472    5.3483    5.4494    5.5506    5.6517    5.7528    5.8539    5.9551
 Columns 51 through 60:
    6.0562    6.1573    6.2584    6.3596    6.4607    6.5618    6.6629    6.7640    6.8652    6.9663
 Columns 61 through 70:
    7.0674    7.1685    7.2697    7.3708    7.4719    7.5730    7.6742    7.7753    7.8764    7.9775
 Columns 71 through 80:
    8.0787    8.1798    8.2809    8.3820    8.4831    8.5843    8.6854    8.7865    8.8876    8.9888
 Columns 81 through 90:
    9.0899    9.1910    9.2921    9.3933    9.4944    9.5955    9.6966    9.7978    9.8989   10.0000

>> v=linspace(1,10,20)
v =
 Columns 1 through 10:
    1.0000    1.4737    1.9474    2.4211    2.8947    3.3684    3.8421    4.3158    4.7895    5.2632
 Columns 11 through 20:
    5.7368    6.2105    6.6842    7.1579    7.6316    8.1053    8.5789    9.0526    9.5263   10.0000

>> v=[9 1 7 2 5]
v =
   9   1   7   2   5

>> numel(v)
ans = 5
>> numel(v);
>> lenght(v);
error: 'lenght' undefined near line 1, column 1
>> lenght(v)
error: 'lenght' undefined near line 1, column 1
>> lenghth(v)
error: 'lenghth' undefined near line 1, column 1
>> length(v)
ans = 5
>> v(end)
ans = 5
>> v(end-1)
ans = 2
>> v(1:end~2)
error: syntax error

>>> v(1:end~2)
           ^
>> v(1:end~7)
error: syntax error

>>> v(1:end~7)
           ^
>> v(1:end~=7)
ans =
   9   1   7   2   5

>> v(1:end~=2)
ans =
   9   7   2   5

>> v(1:end~=3)
ans =
   9   1   2   5

>> [v 1 2]
ans =
   9   1   7   2   5   1   2

>> [v; 1 2]
error: vertical dimensions mismatch (1x5 vs 1x2)
>> [v; 1 2 3 4 5]
ans =
   9   1   7   2   5
   1   2   3   4   5

>> [v 1 2 3 4 5]
ans =
   9   1   7   2   5   1   2   3   4   5

>> w=[1 2 3 4 5]
w =
   1   2   3   4   5

>> v(2)=[]
v =
   9   7   2   5

>> v(2:5)=[]
error: A(I) = []: index out of bounds: value 5 out of bound 4
>> v(2:4)=[]
v = 9
>> v=1:3
v =
   1   2   3

>> w=4:6
w =
   4   5   6

>> v*w'
ans = 32
>> min(v)
ans = 1
>> [vmin imin]=min(v)
vmin = 1
imin = 1
>> sort(v,'ascend')
ans =
   1   2   3

>> sort(v,'descend')
ans =
   3   2   1

>> a=zeros[2,2,2]
error: syntax error

>>> a=zeros[2,2,2]
           ^
>> a=zeros(2,2,2)
a =
ans(:,:,1) =
   0   0
   0   0
ans(:,:,2) =
   0   0
   0   0

>> v=4-ones(5,1)
v =
   3
   3
   3
   3
   3

>> a=zeros(3,3,3)
a =
ans(:,:,1) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,2) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,3) =
   0   0   0
   0   0   0
   0   0   0

>> a=zeros(3,3,3,3)
a =
ans(:,:,1,1) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,2,1) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,3,1) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,1,2) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,2,2) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,3,2) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,1,3) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,2,3) =
   0   0   0
   0   0   0
   0   0   0
ans(:,:,3,3) =
   0   0   0
   0   0   0
   0   0   0

>> v=1 2 3 2
error: syntax error

>>> v=1 2 3 2
        ^
>> v=[1 2 3 2]
v =
   1   2   3   2

>> mode(v)
ans = 2