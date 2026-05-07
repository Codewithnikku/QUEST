#include <iostream>
using namespace std;

class ListNode {
    public:
        int val;
        ListNode* next;
        ListNode(int x): val(x), next(NULL){}
};

class OELL {
public:
    ListNode* oddEvenList(ListNode* head) {
        if (!head || !head->next) return head;

        ListNode* odd = head;
        ListNode* even = head->next;
        ListNode* evenHead = even;

        while (even && even->next) {
            odd->next = odd->next->next;
            even->next = even->next->next;
            odd = odd->next;
            even = even->next;
        }

        odd->next = evenHead;
        return head;
    }
};

int main(){
    int arr[] = {1, 2, 3, 4, 5};
    ListNode* head = new ListNode(arr[0]);
    ListNode* temp = head;
    for(int i = 1; i < 5; i++){
        temp->next = new ListNode(arr[i]);
        temp = temp->next;
    }
    cout << "Input: [";
    temp = head;
    while(temp != NULL){
        cout << temp->val;
        if(temp->next != NULL) cout << ",";
        temp = temp->next;
    }
    cout << "]";
    cout << endl;
    return 0;
}