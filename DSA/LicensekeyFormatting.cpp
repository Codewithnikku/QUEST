#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

class LicenseKeyFormatting {
public:
    string licenseKeyFormatting(string s, int k) {
        string result;
        int count = 0;
        for(int i = s.size() - 1; i >= 0; --i) {
            if(s[i] == '-') continue;
            if(count > 0 && count % k == 0) {
                result += '-';
            }
            result += toupper(s[i]);
            count++;
        }
        reverse(result.begin(), result.end());
        return result;
    }
};

int main(){
    LicenseKeyFormatting lkf;
    string s = "2-5g-3-J";
    int k = 2;
    cout << lkf.licenseKeyFormatting(s, k) << endl;
    return 0;
}