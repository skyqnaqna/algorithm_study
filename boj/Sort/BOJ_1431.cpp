// 백준 1431 시리얼 번호
// 21.02.08
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

typedef long long ll;

using namespace std;

bool compare(string a, string b)
{
    if (a.length() == b.length())
    {
        int sumA = 0, sumB = 0;
        for (int i = 0; i < a.length(); ++i)
        {
            if (a[i] >= '0' && a[i] <= '9')
            {
                sumA += a[i] - '0';
            }
        }
        for (int i = 0; i < b.length(); ++i)
        {
            if (b[i] >= '0' && b[i] <= '9')
            {
                sumB += b[i] - '0';
            }
        }

        if (sumA == sumB)
        {
            return a < b;
        }
        else return sumA < sumB;
    }
    else return a.length() < b.length();
}

int main()
{
    int n; cin >> n;
    vector <string> v;
    for (int i = 0; i < n; ++i)
    {
        string s; cin >> s;
        v.push_back(s);
    }

    sort(v.begin(), v.end(), compare);

    for (int i = 0; i < n; ++i)
        cout << v[i] << "\n";

    return 0;
}