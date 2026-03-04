class reformatDate {
public:
    string reformatDate(string date) {
        vector<string> months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        int year = stoi(date.substr(date.size() - 4));
        int month = find(months.begin(), months.end(), date.substr(date.size() - 8, 3)) - months.begin() + 1;
        int day = stoi(date.substr(0, date.size() - 8));
        return to_string(year) + "-" + (month < 10 ? "0" + to_string(month) : to_string(month)) + "-" + (day < 10 ? "0" + to_string(day) : to_string(day));
    }
};