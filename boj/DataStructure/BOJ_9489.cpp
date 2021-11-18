/*
 백준 9489 사촌
 21.11.18
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

void input() {
    freopen("input.txt", "r", stdin);
}

int n, k, arr[1001];
vector <int> ans, res;
vector <vector <int> > query;

void output() {
    ifstream readFile;
    readFile.open("output.txt");

    if (readFile.is_open()) {
        while (!readFile.eof()) {
            string a;
            getline(readFile, a);
            ans.push_back(stoi(a));
        }
        readFile.close();
    }
}

void debug() {
    for (int i = 0; i < ans.size(); ++i) {
        if (ans[i] != res[i]) {
            cout << "ans : " << ans[i] << " res : " << res[i] << " n, k : " << query[i][0] << " " << query[i][1] << endl;
            for (int j = 2; j < query[i].size(); ++j) {
                cout << query[i][j] << " ";
            }
            cout << endl;
        }
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

//    output();

//    input();

    while (1) {
        cin >> n >> k;
        vector <int> q;
        q.push_back(n); q.push_back(k);
        if (n == 0 && k == 0) break;

        for (int i = 0; i < n; ++i) {
            cin >> arr[i];
            q.push_back(arr[i]);
        }

        query.push_back(q);

//        if (n < 5) {
//            cout << 0 << endl;
//            res.push_back(0);
//            continue;
//        }

        vector <vector <int> > child(n);
        vector <int> temp, parent(n, 0);

        int i = 2, ki = 0;
        int pi = parent[0] = -1;
//        temp.push_back(1);
//        child[pi].push_back(1);


//        while (i < n) {
//            if (arr[i] - 1 == arr[i-1]) {
////                temp.push_back(i);
//                child[pi].push_back(i++);
//            } else {
////                child.push_back(temp);
////                temp.clear();
////                temp.push_back(i);
//                child[++pi].push_back(i++);
//            }
////            ++i;
//        }
////        child.push_back(temp);
//
//        for (int j = 0; j < child.size(); ++j) {
//            for (auto x : child[j]) {
//                parent[x] = j;
//
//                if (arr[x] == k) ki = x;
//            }
//        }

        for (int j = 1; j < n; ++j) {
            if (arr[j] == k) ki = j;
            if (arr[j] != arr[j-1] + 1) ++pi;
            parent[j] = pi;
        }

        int cnt = 0, parentNum = parent[ki], grandparentNum = parent[parent[ki]];

        if (parentNum == -1) {
            cout << 0 << endl;
            res.push_back(0);
            continue;
        }

//        for (auto &p : child[grandparentNum]) {
//            if (p == parentNum) continue;
//
//            cnt += (int)child[p].size();
//        }
//
//        cout << cnt << endl;
//        res.push_back(cnt);
//    }

        for (int j = 1; j < n; ++j) {
            if (parent[j] != parentNum && parent[parent[j]] == grandparentNum) ++cnt;
        }

        cout << cnt << endl;
    }

//    debug();

    return 0;
}