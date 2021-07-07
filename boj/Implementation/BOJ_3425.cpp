/*
 백준 3425 고스택
 21.07.07
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9 + 1
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

stack<ll>st;

void init(ll a) {
    while (!st.empty()) st.pop();
    st.push(a);
}

void numx(ll x) {
    st.push(x);
}

bool pop() {
    if (st.empty()) return false;
    st.pop();
    return true;
}

bool inv() {
    if (st.empty()) return false;

    ll x = st.top();
    st.pop();
    st.push(-x);
    return true;
}

bool dup() {
    if (st.empty()) return false;
    st.push(st.top());
    return true;
}

bool swp() {
    if (st.size() < 2) return false;
    ll first = st.top();
    st.pop();
    ll second = st.top();
    st.pop();

    st.push(first);
    st.push(second);
    return true;
}

bool add() {
    if (st.size() < 2) return false;
    ll op2 = st.top();
    st.pop();
    ll op1 = st.top();
    st.pop();

    if (abs(op1 + op2) >= INF) return false;
    st.push(op1 + op2);
    return true;
}

bool sub() {
    if (st.size() < 2) return false;
    ll op2 = st.top();
    st.pop();
    ll op1 = st.top();
    st.pop();

    if (abs(op1 - op2) >= INF) return false;
    st.push(op1 - op2);
    return true;
}

bool mul() {
    if (st.size() < 2) return false;
    ll op2 = st.top();
    st.pop();
    ll op1 = st.top();
    st.pop();

    if (abs(op1 * op2) >= INF) return false;
    st.push(op1 * op2);
    return true;
}

bool div() {
    if (st.size() < 2 || st.top() == 0) return false;
    ll sign = 1;
    ll op2 = st.top();
    st.pop();
    ll op1 = st.top();
    st.pop();

    if (op1 < 0) sign *= -1;
    if (op2 < 0) sign *= -1;

    st.push(sign * abs(op1) / abs(op2));
    return true;
}

bool mod() {
    if (st.size() < 2 || st.top() == 0) return false;
    ll sign = 1;
    ll op2 = st.top();
    st.pop();
    ll op1 = st.top();
    st.pop();

    if (op1 < 0) sign *= -1;

    st.push(sign * abs(op1) % abs(op2));
    return true;
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    while(1) {
        vector<string>command;
        vector<ll>answer;
        while (1) {
            string s;
            getline(cin, s);

            if (s == "") continue;
            else if (s == "END") break;
            else if (s == "QUIT") exit(0);

            command.push_back(s);
        }

        int n; cin >> n;

        while (n-->0) {
            ll k; cin >> k;
            bool error = false;
            init(k);

            for (auto &s : command) {
                if (s == "POP") {
                    if (!pop()) {
                        error = true;
                        break;
                    }
                } else if (s == "INV") {
                    if (!inv()) {
                        error = true;
                        break;
                    }
                } else if (s == "DUP") {
                    if (!dup()) {
                        error = true;
                        break;
                    }
                } else if (s == "SWP") {
                    if (!swp()) {
                        error = true;
                        break;
                    }
                } else if (s == "ADD") {
                    if (!add()) {
                        error = true;
                        break;
                    }
                } else if (s == "SUB") {
                    if (!sub()) {
                        error = true;
                        break;
                    }
                } else if (s == "MUL") {
                    if (!mul()) {
                        error = true;
                        break;
                    }
                } else if (s == "DIV") {
                    if (!div()) {
                        error = true;
                        break;
                    }
                } else if (s == "MOD") {
                    if (!mod()) {
                        error = true;
                        break;
                    }
                } else {
                    // NUM X
                    ll x = stoi(s.substr(4, s.length() - 4));
                    numx(x);
                }
            }
            if (st.empty() || st.size() > 1 || error) {
                answer.push_back(INF);
            } else {
                answer.push_back(st.top());
            }
        }
        for (auto &i : answer) {
            if (i == INF) cout << "ERROR\n";
            else cout << i << endl;
        }
        cout << endl;
    }

    return 0;
}
