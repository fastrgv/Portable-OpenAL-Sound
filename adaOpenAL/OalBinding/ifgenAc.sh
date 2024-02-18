
# This script merely creates the interface
# specification that makes up the binding.
# So we might just as well use the
# AdaCore Ada compiler to do that.


# set priority path to AdaCore compiler:
export PATH=$HOME/opt/GNAT/2019/bin:$PATH
#export PATH=$HOME/opt/gnat-x86_64-linux-12.1.0-2/bin:$PATH


# create oal_hpp.ads:
g++ -c -fdump-ada-spec -C oal.hpp -Iincoal


