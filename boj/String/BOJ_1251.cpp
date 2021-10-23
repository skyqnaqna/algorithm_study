/*
 21.10.23
 백준 1251 단어 나누기
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (ll)2e12
#define endl "\n"
#define TXTOPEN freopen("input.txt", "r", stdin)

int n;
string s;
bool visited[50];
vector <int> v;
vector <string> ans;

void recursive(int idx, int cnt) {
    if (cnt == 2) {
        int left = v[0], right = v[1];

        if (right - left == 1) return;

        string temp = s;
        reverse(temp.begin(), temp.begin() + left + 1);
        reverse(temp.begin() + left + 1, temp.begin() + right);
        reverse(temp.begin() + right, temp.end());

        ans.emplace_back(temp);

        return;
    }

    for (int i = idx; i < n; ++i) {
        if (!visited[i]) {
            visited[i] = true;
            v.emplace_back(i);
            recursive(i + 1, cnt + 1);
            visited[i] = false;
            v.pop_back();
        }
    }

}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> s;
    n = s.length();

    recursive(0, 0);

    sort(ans.begin(), ans.end());

    cout << ans[0] << endl;

    return 0;
}