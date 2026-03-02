#include <iostream>
using namespace std;

class RepeatedStringMatch{
public:
     int repeatedStringMatch(string a, string b) {
        string temp = a;
        int count = 1;

        while (temp.size() < b.size()) {
            temp += a;
            count++;
        }

        if (temp.find(b) != string::npos) return count;

        temp += a;
        if (temp.find(b) != string::npos) return count + 1;

        return -1;
    }
}; 

int main(){
    RepeatedStringMatch rsm;
    string a = "abcabcabc";
    string b = "abc";
    cout << rsm.repeatedStringMatch(a, b) << endl;
    return 0;
}