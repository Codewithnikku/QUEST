#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

class MaskingPersonalInformation
{
public:
    string maskPII(string s)
    {
        if (s.find('@') != string::npos)
        {
            transform(s.begin(), s.end(), s.begin(), ::tolower);

            int atPos = s.find('@');
            string name = s.substr(0, atPos);
            string domain = s.substr(atPos);

            return string(1, name[0]) + "*****" + string(1, name.back()) + domain;
        }
        else
        {
            string digits;
            for (char c : s)
            {
                if (isdigit(c))
                {
                    digits += c;
                }
            }
            string masked = "***-***-" + digits.substr(digits.size() - 4);
            if (digits.size() > 10)
            {
                masked = "+" + string(digits.size() - 10, '*') + "-" + masked;
            }
            return masked;
        }
    }
};

int main()
{
    MaskingPersonalInformation mpi;
    string s1 = "LeetCode@LeetCode.com";
    cout << mpi.maskPII(s1) << endl;
    string s2 = "1234567890";
    cout << mpi.maskPII(s2) << endl;
    return 0;
}