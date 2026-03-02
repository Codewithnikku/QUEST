#include <iostream>
using namespace std;

class RotateString {
public:
    bool rotateString(string s, string goal) {
        if(s.size() != goal.size()) return false;
        string doubled = s + s;
        return doubled.find(goal) != string::npos;
    }
};

int main(){
    RotateString rs;
    string s = "abcde";
    string goal = "cdeab";
    cout << rs.rotateString(s, goal) << endl;
    return 0;
}

