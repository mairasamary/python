# pythonimage

This script will help you to create a Python 3 virtual environemtn with the required
libraries for the course.

## Installation

Open a terminal on your Mac on your home directory and run the following command:

```bash
git clone https://github.com/mairasamary/python
```

This will download the contents of this repository on your Mac. Now change to this new folder and run the mac_setup.sh script:

```bash
cd ./python
./mac_setup.sh
```

This will create a virtual environment with the required libraries for the course. At the end of the script, you should see something like this:

```bash
...

Required libraries installed! Exiting environment!

Run the following to activate your environment:

	source /Users/asamary/git/python/BCPYTHON/bin/activate
```

**This instruction will be different for every PC. Take note of it!**

From now on, every time you need to run a python script from the course, open a terminal and use this instruction activate your virtual environemnt. Then you will be able to run your script without problems.

## Testing your instalation

If you just run the mac_setup.sh script, test your environment with the plots01.py sample script. First you will need to activate your virtual environment, they you should be able to run the script and see a nice matplotlib graph on your screen.

```bash
source /Users/asamary/git/python/BCPYTHON/bin/activate
python3 ./plots01.py
```

## X11 Installation

If your Mac doesn't have X11 installed, try installing Quartz from the URL bellow:

https://www.xquartz.org