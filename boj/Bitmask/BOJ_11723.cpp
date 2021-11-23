/*
 백준 11723 집합
 21.11.23
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)1e9
#define endl "\n"

void input() {
    freopen("input.txt", "r", stdin);
}

void output() {
    ifstream readFile;
    readFile.open("output.txt");

    if (readFile.is_open()) {
        while (!readFile.eof()) {
            string a;
            getline(readFile, a);
//            ans.push_back(stoi(a));
        }
        readFile.close();
    }
}

int n, m, s;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> m;

    while (m-->0) {
        string q; cin >> q;

        if (q == "add") {
            cin >> n;
            s |= (1 << n);
        } else if (q == "remove") {
            cin >> n;
            s &= ~(1 << n);
        } else if (q == "check") {
            cin >> n;
            if ((s & (1 << n)) != 0) cout << 1 << endl;
            else cout << 0 << endl;
        } else if (q == "toggle") {
            cin >> n;
            s ^= (1 << n);
        } else if (q == "all") {
            s = (1 << 21) - 1;
        } else {
            s = 0;
        }
    }

    return 0;
}