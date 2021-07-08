/*
 백준 2504 괄호의 값
 21.07.08
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

stack<string>st;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    string s; cin >> s;

    for (auto &c : s) {
        string temp;
        if (c == '(' || c == '[') st.push(temp+=c);
        else if (st.empty()) {
            cout << 0 << endl;
            return 0;
        } else if (c == ')') {
            if (st.top() == "[") {
                cout << 0 << endl;
                return 0;
            }

            int num = 2;

            if (st.top() == "(") {
                st.pop();
            } else {
                num *= stoi(st.top());
                st.pop();

                if (st.empty() || st.top() != "(") {
                    cout << 0 << endl;
                    return 0;
                }

                if (!st.empty() && st.top() == "(") st.pop();
            }

            if (!st.empty() && st.top() != "(" && st.top() != "[") {
                num += stoi(st.top());
                st.pop();
            }

            st.push(to_string(num));

        } else if (c == ']') {
            if (st.top() == "(") {
                cout << 0 << endl;
                return 0;
            }

            int num = 3;

            if (st.top() == "[") {
                st.pop();
            } else {
                num *= stoi(st.top());
                st.pop();

                if (st.empty() || st.top() != "[") {
                    cout << 0 << endl;
                    return 0;
                }
                if (!st.empty() && st.top() == "[") st.pop();
            }

            if (!st.empty() && st.top() != "(" && st.top() != "[") {
                num += stoi(st.top());
                st.pop();
            }

            st.push(to_string(num));

        }
    }


    if (st.empty() || st.size() > 1) cout << 0 << endl;
    else cout << st.top() << endl;

    return 0;
}