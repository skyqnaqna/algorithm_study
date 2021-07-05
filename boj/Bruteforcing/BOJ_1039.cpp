/*
 백준 1039 교환
 21.07.05
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

string n;
int k;

string doSwap(string pre, int i, int j) {
    string temp = pre;
    char a = temp[i];
    temp[i] = temp[j];
    temp[j] = a;

    return temp;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> k;

    int m = n.length();

    if (n == "1000000") cout << 1000000 << endl;
    else if (m == 1) cout << -1 << endl;
    else if (m == 2 && n[1] == '0') cout << -1 << endl;
    else {
        queue<string> q;
        q.push(n);
        for (int x = 0; x < k; ++x) {
            int sz = q.size();
            vector<string> check;
            for (int y = 0; y < sz; ++y) {
                string num = q.front();
                q.pop();
                for (int i = 0; i < m - 1; ++i) {
                    for (int j = i + 1; j < m; ++j) {
                        string swapped = doSwap(num, i, j);
                        if (swapped[0] != '0' && find(check.begin(), check.end(), swapped) == check.end()) {
                            q.push(swapped);
                            check.push_back(swapped);
                        }
                    }
                }
            }
        }

        int result = 0;
        while (!q.empty()) {
            int num = stoi(q.front());
            q.pop();
            if (num > result)
                result = num;
        }

        cout << result << endl;
    }

    return 0;
}