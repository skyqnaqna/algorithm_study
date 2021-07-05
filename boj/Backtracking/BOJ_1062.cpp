/*
 백준 1062 가르침
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

bool alphabet[26];
vector<string> words;
vector<int>ans;
int n, k;

void init() {
    char fixed[5] = {'a', 'n', 't', 'i', 'c'};

    for (char &c : fixed) alphabet[c - 'a'] = true;
}

void combination(int idx, int cnt) {
    if (cnt == k - 5) {
        int res = 0;
        for (auto &word : words) {
            bool isValid = true;
            for (auto &ch : word) {
                if (!alphabet[ch - 'a']) {
                    isValid = false;
                    break;
                }
            }
            if (isValid) res++;
        }
        ans.push_back(res);
    } else {
        for (int i = idx; i < 26; ++i) {
            if (!alphabet[i]) {
                alphabet[i] = true;
                combination(i + 1, cnt + 1);
                alphabet[i] = false;
            }
        }
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> k;

    for (int i = 0; i < n; ++i) {
        string s; cin >> s;
        words.push_back(s);
    }

    if (k < 5) cout << 0 << endl;
    else if (k == 5) {
        init();
        combination(0, 0);
        cout << ans[0] << endl;
    }
    else {
        for (int i = 1; i < 26; ++i) {
            init();
            if (!alphabet[i]) {
                alphabet[i] = true;
                combination(i + 1, 1);
                alphabet[i] = false;
            }
        }

        cout << *max_element(ans.begin(), ans.end()) << endl;
    }

    return 0;
}