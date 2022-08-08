#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <fstream>


using namespace std;

int main()
{
    string line;
    string text=" ";
   
 
    ifstream in("report.txt"); // окрываем файл для чтения

    if (in.is_open())
    {
        while (getline(in,line))
        {
            size_t deleted=line.find("deleted");

            if(deleted!=std::string::npos)
            {
                size_t found_1=line.find("Shelma");
                size_t found_2=line.find("EICAR");

                if (found_1!=std::string::npos)
                {
                    text+=to_string(0);
                } 
                if(found_2!=std::string::npos)
                {
                    text+=to_string(1);
                } 

            }
            
            
        }

    }
    

    //reverse(text.begin(), text.end());
    
    cout<<endl<<"Text with the file:"<<endl;

    cout<<endl<<text<<endl; 
     
    cout <<endl<< "End of program" << endl;

    in.close();    

    return 0;
}