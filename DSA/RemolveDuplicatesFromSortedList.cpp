#include <iostream>
using namespace std;

class ListNode {
    public:
    int val;
    ListNode* next;
    ListNode(int x) : val(x), next(NULL) {}
};

class RDFSL : public ListNode {
public:
    RDFSL(int x) : ListNode(x) {}
    ListNode* deleteDuplicates(ListNode* head) {
        if(head == NULL) return head;
        ListNode* temp = head;
        while(temp->next != NULL){
            if(temp->val == temp->next->val){
                ListNode* toDelete = temp->next;
                temp->next = temp->next->next;
                delete toDelete;
            }
            else{
                temp = temp->next;
            }
        }
        return head;
    }
};

int main(){
    int arr[] = {1, 1, 2};
    RDFSL* list = new RDFSL(arr[0]);
    ListNode* head = list;
    ListNode* temp = head;
    for(int i = 1; i < 3; i++){
        temp->next = new RDFSL(arr[i]);
        temp = temp->next;
    }
    head = list->deleteDuplicates(head);
    cout << "Output: [";
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