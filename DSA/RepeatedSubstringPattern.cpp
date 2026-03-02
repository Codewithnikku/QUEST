#include <iostream>
using namespace std;

class RepeatedSubstringPattern {
public: 
    bool repeatedSubstringPattern(string s) {
        int n = s.size();
        for(int len = 1; len <= n / 2; ++len) {
            if(n % len == 0) {
                string pattern = s.substr(0, len);
                string repeated;
                for(int i = 0; i < n / len; ++i) {
                    repeated += pattern;
                }
                if(repeated == s) return true;
            }
        }
        return false;
    }
};

int main(){
    RepeatedSubstringPattern rsp;
    string s = "abcabcabc";
    cout << rsp.repeatedSubstringPattern(s) << endl;
    return 0;
}