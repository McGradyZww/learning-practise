# include <iostream>
# include <algorithm>
# include <vector>
using namespace std;

bool closed_shape(vector<double> w)
{
    if (w.size() == 1) {
        return false;
    }
    if (w.size() == 2) {
        if (w[0] == w[1]) {
            return true;
        } else {
            return false;
        }
    }
    sort(w.begin(), w.end());
    double sum = w[0] + w[1];
    bool satisfaction = false;
    for (int i = 2; i < w.size() && !satisfaction; ++i) {
        if (w[i] <= sum) {
            satisfaction = true;
            break;
        }
        sum += w[i];
    }
    if (satisfaction) {
        return true;
    } else {
        return false;
    }

}

int main()
{
    int n;
    while (cin >> n) {
        if (n == 0) {
            break;
        }
        vector<double> wires;
        for (int i = 0; i < n; ++i) {
            double ai;
            cin >> ai;
            wires.push_back(ai);            //////wires.push_back();wires.erase(wires[i]);
                                                  //sort(wires.begin(),wires.end())
       }
        if (closed_shape(wires)) {
            cout << "YES" << endl;
        } else {
            cout << "NO" << endl;
        }
    }
    system("pause");
    return 0;
}
/*������
    ����и��Ӽ�S�ܹ��ɶ�����Ҳ�����̵�һ��ai������԰�ai����S����Ȼ��һ������Ρ���Sһ��������̱�ai��
    ����Щ��Բ�������С����Ϊb1, b2, b3, ���� , bn���������ĳһ�Ӽ�S'�ܹ��ɶ���Σ�S' = {bi1, bi2, ���� , bik} (bi1��bi2�ܡ�����bik)����
                      bik �� bi1 + ���� + bi(k-1).
��b1, b2, ���� , bik ���ܹ��ɶ���Ρ���Ϊ������S = {b1, b2, ���� , bik}, S' = {bi1, bi2, ���� , bik}, S'' = S - S'��
                      bik �� bi1 + ���� + bi(k-1) �� bi1 + ���� + bi(k-1) + sum(S'').
������sum(A)�Լ���A������Ԫ����ͣ�
ע�⣺�����ԭ���Ǳ���������ĶΣ��Ӷ��ƻ�����Ρ�

�������ߣ��㷨Ϊ
    sorts input array w;
    sum = w1 + w2;
    for i = 2 to n
        if wi �� sum then
            print "They can be made a closed shape."
        else sum = sum + wi;
*/
