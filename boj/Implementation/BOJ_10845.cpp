/*
 백준 10845 큐
 21.07.07
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

queue<int>q;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    int n; cin >> n;

    while (n-->0) {
        string s; cin >> s;

        if (s == "push") {
            int x; cin >> x;

            q.push(x);
        } else if (s == "pop") {
            if (q.empty()) cout << -1 << endl;
            else {
                cout << q.front() << endl;
                q.pop();
            }
        } else if (s == "size") cout << q.size() << endl;
        else if (s == "empty") {
            if (q.empty()) cout << 1 << endl;
            else cout << 0 << endl;
        } else if (s == "front") {
            if (q.empty()) cout << -1 << endl;
            else cout << q.front() << endl;
        } else {
            if (q.empty()) cout << -1 << endl;
            else cout << q.back() << endl;
        }
    }

    return 0;
}