// Virtual machine detection.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include <iostream>
#include <vector>
#include <string>
#include <Windows.h>
#include <windows.h>
#include <winbase.h>
#include <fstream>

using namespace std;


std::string execute(const std::string& command)
{
    system((command + " | more > temp.txt").c_str());

    ifstream ifs("temp.txt");

    string ret{ std::istreambuf_iterator<char>(ifs), std::istreambuf_iterator<char>() };

    ifs.close(); // must close the inout stream so the file can be cleaned up

    if (std::remove("temp.txt") != 0)
    {
        perror("Error deleting temporary file");
    }

    return ret;
}

bool Is_VM_system()
{

    string system_information=execute("wmic computersystem get model,manufacturer");

    if (system_information.find("Virtual") != std::string::npos|| system_information.find("virtual") != std::string::npos)
    {
        cout << endl << system_information << endl;
        return true;
    }
    else
    {
        return false;
    }
}

bool IsVM_file()
{
    vector<string> file_name;

    //VMware
    {
        file_name.push_back("C:\\Windows\\System32\\drivers\\Vmmouse.sys");
        file_name.push_back("C:\\Windows\\System32\\drivers\\vm3dgl.dll");
        file_name.push_back("C:\\Windows\\System32\\drivers\\vmdum.dll");
        file_name.push_back("C:\\Windows\\System32\\drivers\\vm3dver.dll");
        file_name.push_back("C:\\Windows\\System32\\drivers\\vmtray.dll");
        file_name.push_back("C:\\Windows\\System32\\drivers\\VMToolsHook.dll");
        file_name.push_back("C:\\Windows\\System32\\drivers\\vmmousever.dll");
        file_name.push_back("C:\\Windows\\System32\\drivers\\vmhgfs.dll");
        file_name.push_back("C:\\Windows\\System32\\drivers\\vmGuestLib.dll");
        file_name.push_back("C:\\Windows\\System32\\drivers\\VmGuestLibJava.dll");
    }

    //VirtualBox
    {
        file_name.push_back("C:\\Windows\\System32\\drivers\\VBoxMouse.sys");
        file_name.push_back("C:\\Windows\\System32\\drivers\\VBoxGuest.sys");
        file_name.push_back("C:\\Windows\\System32\\drivers\\VBoxSF.sys");
        file_name.push_back("C:\\Windows\\System32\\drivers\\VBoxVideo.sys");
        file_name.push_back("C:\\Windows\\System32\\vboxdisp.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxhook.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxmrxnp.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxoglarrayspu.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxoglcrutil.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxoglerrorspu.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxoglfeedbackspu.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxoglpackspu.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxoglpassthroughspu.dll");
        file_name.push_back("C:\\Windows\\System32\\vboxservice.exe");
        file_name.push_back("C:\\Windows\\System32\\vboxtray.exe");
    }


    for (int i=0;i<file_name.size();i++)
    {
        string path = file_name[i];

        GetFileAttributes((LPCWSTR)path.c_str());

        if (INVALID_FILE_ATTRIBUTES == GetFileAttributes((LPCWSTR)path.c_str()) && GetLastError() == ERROR_FILE_NOT_FOUND)
        {
            continue;
        }
        else
        {
            cout << path.c_str() << endl;
            return true;
        }
        
      
    }
 
    return false;
}


int main()
{
    SetConsoleCP(866);
    SetConsoleOutputCP(866);


    if (/*IsVM_file()||*/Is_VM_system())
    {
        cout << endl << "Virtual Machine enviroment is switch on." << endl;
    }
    else
    {
        //First verison program
        /*

            HWND hWnd = GetForegroundWindow();       ShowWindow(hWnd, SW_HIDE);
     
            MessageBox(0, L"Hello Kitty!", L"Virtual Machine enviroment is switch off.", MB_OK);
        */

       //Second version program
        /*
            static const int code_lenght = 44;

            unsigned char opcodes[code_lenght] = "\x55\x48\x89\xe5\xb8\x0a\x00\x00\x00\x5d\xc3";

            HANDLE mem_handle = CreateFileMappingA(INVALID_HANDLE_VALUE, NULL, PAGE_EXECUTE_READWRITE, 0, code_lenght, NULL);

            void* mem_map = MapViewOfFile(mem_handle, FILE_MAP_ALL_ACCESS | FILE_MAP_EXECUTE, 0x0, 0x0, code_lenght);

            memcpy(mem_map, opcodes, sizeof(opcodes));

            cout << ((int(*)())mem_map)() << endl;
        */

        Sleep(1000);

        cin.get();

    }
  

    return 0;
}

// Запуск программы: CTRL+F5 или меню "Отладка" > "Запуск без отладки"
// Отладка программы: F5 или меню "Отладка" > "Запустить отладку"

// Советы по началу работы 
//   1. В окне обозревателя решений можно добавлять файлы и управлять ими.
//   2. В окне Team Explorer можно подключиться к системе управления версиями.
//   3. В окне "Выходные данные" можно просматривать выходные данные сборки и другие сообщения.
//   4. В окне "Список ошибок" можно просматривать ошибки.
//   5. Последовательно выберите пункты меню "Проект" > "Добавить новый элемент", чтобы создать файлы кода, или "Проект" > "Добавить существующий элемент", чтобы добавить в проект существующие файлы кода.
//   6. Чтобы снова открыть этот проект позже, выберите пункты меню "Файл" > "Открыть" > "Проект" и выберите SLN-файл.
