#include <iostream>
using namespace std;

class DetectCapital {
public:
    bool detectCapitalUse(string word) {
        int uppercaseCount = 0;
        for(char c : word) {
            if(isupper(c)) uppercaseCount++;
        }
        return uppercaseCount == 0 || uppercaseCount == word.size() || (uppercaseCount == 1 && isupper(word[0]));
    }
};

int main(){
    DetectCapital dc;
    string word = "USA";
    cout << (dc.detectCapitalUse(word) ? "True" : "False") << endl;
    return 0;
}