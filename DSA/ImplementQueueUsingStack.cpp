class MyQueue {
public:
    MyQueue() {}
    
    void push(int x) {
        if (s2.empty()) {
            while (!s1.empty()) {
                s2.push(s1.top());
                s1.pop();
            }
        }
        s2.push(x);
    }
    
    int pop() {
        if (s1.empty() && s2.empty()) {
            return -1;
        }
        if (s1.empty()) {
            while (!s2.empty()) {
                s1.push(s2.top());
                s2.pop();
            }
        }
        int val = s1.top();
        s1.pop();
        return val;
    }
    
    int peek() {
        if (s1.empty() && s2.empty()) {
            return -1;
        }
        if (s1.empty()) {
            while (!s2.empty()) {
                s1.push(s2.top());
                s2.pop();
            }
        }
        return s1.top();
    }
    
    bool empty() {
        return s1.empty() && s2.empty();
    }
};

