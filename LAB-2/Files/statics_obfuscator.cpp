
#include <iostream>
#include <sstream>
#include <stdint.h>
#include <string>
#include <algorithm>

using namespace std;



int32_t main() 
{
    int32_t eax = 0;
    
    cout<<endl<<"In EAX saves decoded payload:"<<endl;

    string hexadecimal="";

    std::stringstream stream;

    eax -= 0x667f1d9b;
    cout<<endl<<"\t0x"<<std::hex<<eax<<endl; stream<<std::hex<<eax<<"x0 "; string result_a(stream.str());           
    eax -= 0x1f177604;
    cout<<endl<<"\t0x"<<std::hex<<eax<<endl; stream<<std::hex<<eax<<"x0 "; string result_b(stream.str());    
    eax -= 0xc084bfc;
    cout<<endl<<"\t0x"<<std::hex<<eax<<endl; stream<<std::hex<<eax<<"x0 "; string result_c(stream.str());    
    eax -= 0xfbffa8f9;
    cout<<endl<<"\t0x"<<std::hex<<eax<<endl; stream<<std::hex<<eax<<"x0 "; string result_d(stream.str());    
    eax -= 0x11141409;
    cout<<endl<<"\t0x"<<std::hex<<eax<<endl; stream<<std::hex<<eax<<"x0 "; string result_e(stream.str());    
    eax -= 0xe8b3e281;
    cout<<endl<<"\t0x"<<std::hex<<eax<<endl; stream<<std::hex<<eax<<"x0 "; string result(stream.str());    

    reverse(result.begin(),result.end());

    cout<<endl<<"General result: "<<result<<endl;
    
    return 0;
}