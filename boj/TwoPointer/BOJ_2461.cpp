/*
 백준 2461 대표 선수
 21.12.18
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (int)2e9
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

int n, m, maxVal = 0, answer = INF;
vector < vector <int> > arr;
vector <int> pos;
priority_queue <pii> pq;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;

    for (int i = 0; i < n; ++i) {
        vector <int> v;
        int x;
        for (int j = 0; j < m; ++j) {
            cin >> x;
            v.push_back(x);
        }
        sort(v.begin(), v.end());
        arr.push_back(v);
        pos.push_back(0);
    }

    for (int i = 0; i < n; ++i) {
        pq.push({-arr[i][pos[i]], i});
        if (maxVal < arr[i][pos[i]]) maxVal = arr[i][pos[i]];
    }

    while (true) {
        int minVal = -pq.top().first;
        int idx = pq.top().second;
        pq.pop();

        if (maxVal - minVal < answer) answer = maxVal - minVal;

        pos[idx]++;
        if (pos[idx] == m) break;

        pq.push({-arr[idx][pos[idx]], idx});
        if (maxVal < arr[idx][pos[idx]]) maxVal = arr[idx][pos[idx]];
    }

    cout << answer << endl;

    return 0;
}