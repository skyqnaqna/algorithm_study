/*
 백준 1655 가운데를 말해요
 21.07.07
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n;
priority_queue<int>min_q;
priority_queue<int>max_q;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;

        if (min_q.size() == max_q.size()) max_q.push(x);
        else {
            min_q.push(-x);
        }

        if (!min_q.empty() && !max_q.empty() && -min_q.top() <  max_q.top()) {
            max_q.push(-min_q.top());
            min_q.pop();
            min_q.push(-max_q.top());
            max_q.pop();
        }

        cout << max_q.top() << endl;
    }


    return 0;
}
