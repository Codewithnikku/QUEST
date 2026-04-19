#include <iostream>
#include <vector>
using namespace std;

class ValidMountainArray {
public:
    bool validMountainArray(vector<int>& arr) {
        int n = arr.size();
        if(n < 3) return false;

        int i = 0;
        while(i < n-1 && arr[i] < arr[i+1]) i++;
        if(i == 0 || i == n-1) return false;

        while(i < n-1 && arr[i] > arr[i+1]) i++;

        return i == n-1;
    }
};

int main(){
    ValidMountainArray solution;
    vector<int> arr = {0, 3, 2, 1};
    cout << solution.validMountainArray(arr) << endl;// Output
    return 0;
}