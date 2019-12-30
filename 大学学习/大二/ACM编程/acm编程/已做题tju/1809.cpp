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
/*分析：
    如果有个子集S能构成多边形且不含最短的一段ai，则可以把ai加入S，依然是一个多边形。故S一定含有最短边ai。
    将这些半圆排序。设从小到大为b1, b2, b3, …… , bn。如果存在某一子集S'能构成多边形，S' = {bi1, bi2, …… , bik} (bi1≤bi2≤……≤bik)，即
                      bik ≤ bi1 + …… + bi(k-1).
则b1, b2, …… , bik 必能构成多边形。因为，（设S = {b1, b2, …… , bik}, S' = {bi1, bi2, …… , bik}, S'' = S - S'）
                      bik ≤ bi1 + …… + bi(k-1) ≤ bi1 + …… + bi(k-1) + sum(S'').
（函数sum(A)对集合A的所有元素求和）
注意：排序的原因是避免加入过大的段，从而破坏多边形。

由上所诉，算法为
    sorts input array w;
    sum = w1 + w2;
    for i = 2 to n
        if wi ≤ sum then
            print "They can be made a closed shape."
        else sum = sum + wi;
*/
