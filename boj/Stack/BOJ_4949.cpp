/*
 백준 4949 균형잡힌 세상
 21.07.04
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

int main() {
    ios::sync_with_stdio(0); cin.tie(0);


    while (1) {
        string s;
        getline(cin, s);
        stack<char> st;
        bool noFlag = false;

        if (s[0] == '.') break;

        for (auto &ch : s) {
            if (ch == '(' || ch == '[') st.push(ch);

            if (ch == ')') {
                if (st.empty() || st.top() != '(') {
                    noFlag = true;
                    break;
                } else {
                    st.pop();
                }
            } else if (ch == ']') {
                if (st.empty() || st.top() != '[') {
                    noFlag = true;
                    break;
                } else {
                    st.pop();
                }
            }
        }

        if (noFlag || !st.empty()) cout << "no\n";
        else cout << "yes\n";
    }


    return 0;
}
