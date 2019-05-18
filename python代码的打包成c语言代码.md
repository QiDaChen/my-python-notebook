# python代码的打包成c语言代码

Cython是一个快速生成python扩展模块的工具。它允许在python中加入C语言的语法，并且编译后运行的速度比原生的python要高。此外，使用Cython还可以保护你的Python代码，使其闭源，难以被反编译。

安装,windows中直接**command**命令行下输入以下指令

```bash
pip install cpython
```

使用：

1：准备好要打包的python源文件（正常的python源文件后缀是.py，但为了用cython编译，我们需要把后缀改成.pyx）。

![1558197402139](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1558197402139.png)

2：准备一个执行cython编译的脚本：setup.py，并把它放在test.pyx源文件同目录下。其内容如下：

```python

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
 
filename = 'test' # 源文件名
full_filename = 'test.pyx' # 包含后缀的源文件名
 
setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension(filename, [full_filename])] # 配置需要cython编译的源文件

```

3： 这是最后一步：在setup.py文件所在的目录下打开一个cmd控制台（PowerShell也是可以哒~），在控制台中执行以下命令，即可完成cython的编译啦：

****

**python setup.py build_ext --inplace**

![1558197693891](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1558197693891.png)

编译成功后，在同目录下会生成以下编译好的文件（后缀是.pyd）：



    它可以被python直接import，下面在同目录下的cmd或PowerShell控制台运行一下python试试：（为了避免被认为是import了之前的test.pyx文件，我们把同目录下原来的test.pyx文件删掉）依旧能被正正常调用



   由此可见，.pyx编译成.pyd之后，可以被python直接import，这里在写import语句的时候不需要管后面的"cp36-win_amd4"等多余的内容。

    细心的读者不难发现，编译出来的.pyd文件是闭源的！因此，这也是一种让python项目闭源的简单实用的方法。
    
    思考：我们发现刚刚的python代码在原生python下执行跟经过了cython编译后执行做对比，速度并没有什么差别。这是为什么呢？不是说cython可以加速python代码的执行效率吗？
    
    实际上：这是因为我们仍旧采用纯python的语法来编写。这样尽管用cython来编译，执行的时候还是按照python的那一套来运行的。因此效率并不会提升。但是，正因为是用cython编译，我们可以在test.pyx上对源代码进行修改，加入C语言的一些语法（再次强调，后缀是.pyx噢~），这样就能快很多了。
---------------------
