# linux-shell-script learning

# **:construction: `UNDER CONTRUCTION`**

- Required ubuntu container - create image file form `Dockerfile`
- Run container
- Interact the container `docker run --rm -it chutchaikp/ubuntu:1.0.1 `

```s
root@89b7ec96303d:/app# apt update
root@89b7ec96303d:/app# apt install nano
```

### File permission [d][owner][group][other]

```s
$ l
total 8
drwxr-xr-x   4 apple  staff  128 Apr 13 14:49 .
drwxr-xr-x   4 apple  staff  128 Apr 13 14:49 ..
drwxr-xr-x  12 apple  staff  384 Apr 13 14:50 .git
-rw-r--r--   1 apple  staff   21 Apr 13 14:49 README.md
```

- d - directory
- r - read - 4
- w - write - 2
- x - execute - 1

example: drwxr-xr-x => 755

### Echo

echo wording
echo + interpretation
echo valiable
echo + append
echo for print

```s
x=10
echo $x # 10
```

```s
echo "hello" >> test.txt # append hello in file test.txt
```

```s
echo *.txt
# list of txt file
```

### linux operator

1. arithmetic + - \* / = == !=

```s
root@0225386c89e8:/app# x=10
root@0225386c89e8:/app# y=20
root@0225386c89e8:/app# z=$((x + y))
root@0225386c89e8:/app# echo $z
30
```

change file permission `# chmod 755 test.sh`
let's create first bash script `test.sh`

```s
#!/bin/bash

# this is comment
# define valiable
x=10
y=20
z=$((x * y))

echo $z
```

let's run `# ./test.sh` or `# bash test.sh` # will print out 200

2. relational - working with number only

- eq
- ne
- gt
- lt
- ge
- le

### Condition

> if (checking uid for root)

- Create bash file `nano test.sh`

```s
#!/bin/bash

# userid=$((id -u))
x=0

if [[ "${x}" -eq 0 ]]
then
        echo "x equal zero"
        echo $x
        echo 0
else
        echo "x not equal zero"
        echo $x
        exit 1
fi
```

- Run bash `./test.sh`

- And (-a) & Or (-o) example

```s
echo -n 'Enter a number: '
read num
if [ $num -gt 0 -a $num -lt 10 ]
then
        echo "You enter 1 - 9"
else
        echo "Failure"
fi
```

```s
# check id
id
# root@0225386c89e8:/app# id
# uid=0(root) gid=0(root) groups=0(root)
```

```s
cat /etc/passwd

# print out
root@0225386c89e8:/app# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
_apt:x:100:65534::/nonexistent:/usr/sbin/nologin
messagebus:x:101:101::/nonexistent:/usr/sbin/nologin
```

### Program gen MD5 password

- Create new file `touch md5gen.sh && chmod 755 md5gen.sh`

```s
#!/bin/bash

# define variable
echo "Please enter password "
# read input and assign to variable
read -s user01


# confirm
echo "Please re-enter password "
read -s user02

# verify by if
if  [[ "${user01}" != "${user02}" ]]
then
        echo "Your password is not match!"
        exit 1
else
        echo "Please find MD5 password bellow"
        openssl passwd -1 $user02
        exit 0
fi
```

### Rename file name (js1 to js2)

- Create new file `touch test2.sh && chmod 755 test2.sh`
- Create new file `touch js1`

```s
#!/bin/bash
mv $1 $2
```

Run `./test2.sh js1 js2`

### Loop while example

- Create new file `# touch while.sh && chmod 755 while.sh`
- Edit `# nano while.sh`

```s
count=1
while [ $count -le 10]
	do
		echo $count
		count=`expr $count + 1 `
	done
```

- Run it `# ./while.sh` result bellow

```s
root@449ddde42347:/app# ./while.sh
1
2
3
4
5
6
7
8
9
10
```

### Loop for example

```s
# for var in 1 2 3 4 5 6
for var in *
	do
		echo $var
	done
```
