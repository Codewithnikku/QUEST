#include <iostream>
#include <string>
#include <vector>
using namespace std;

class EvaluateReversePolishNotation {
public:
    int evalRPN(vector<string>& tokens) {
        vector<int> stack;
        for (const string& token : tokens) {
            if (token == "+" || token == "-" || token == "*" || token == "/") {
                int b = stack.back(); stack.pop_back();
                int a = stack.back(); stack.pop_back();
                if (token == "+") stack.push_back(a + b);
                else if (token == "-") stack.push_back(a - b);
                else if (token == "*") stack.push_back(a * b);
                else stack.push_back(a / b);
            } else {
                stack.push_back(stoi(token));
            }
        }
        return stack.back();
    }
};

int main() {
    EvaluateReversePolishNotation sol;
    vector<string> tokens = {"2", "1", "+", "3", "*"};
    int result = sol.evalRPN(tokens);
    cout << "Result: " << result << endl; // Output should be 9
    return 0;
}