#include <iostream>
#include <vector>
using namespace std;

class NumberOfStudentsUnableToEatLunch {
public:
    int countStudents(vector<int>& students, vector<int>& sandwiches) {
        int count0 = 0, count1 = 0;
        for (int s : students) {
            if (s == 0) {
                count0++;
            } else {
                count1++;
            }
        }

        for (int sandwich : sandwiches) {
            if (sandwich == 0) {
                if (count0 > 0) {
                    count0--;
                } else {
                    break;
                }
            } else {
                if (count1 > 0) {
                    count1--;
                } else {
                    break;
                }
            }
        }

        return count0 + count1;
    }
};

int main() {
    NumberOfStudentsUnableToEatLunch solution;
    vector<int> students = {1, 1, 0, 0};
    vector<int> sandwiches = {0, 1, 0, 1};
    int result = solution.countStudents(students, sandwiches);
    cout << "Number of students unable to eat lunch: " << result << endl;
    return 0;
}