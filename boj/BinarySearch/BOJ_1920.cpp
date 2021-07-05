/*
 백준 1920 수 찾기
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

int n, m;
vector <int> A;
vector <int> Q;

bool findNum(int target) {
    int mid, left = 0, right = n -1;

    while (left <= right) {
        mid = (left + right) / 2;

        if (A[mid] == target) return true;
        else if (A[mid] < target) left = mid + 1;
        else right = mid - 1;
    }
    return false;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;
    for (int i = 0; i < n; ++i) {
        int a; cin >> a;
        A.push_back(a);
    }

    sort(A.begin(), A.end());

    cin >> m;
    for (int i = 0; i < m; ++i) {
        int q; cin >> q;
        Q.push_back(q);
    }

    for (int i = 0; i < m; ++i) {
        if (findNum(Q[i])) cout << 1 << endl;
        else cout << 0 << endl;
    }

    return 0;
}