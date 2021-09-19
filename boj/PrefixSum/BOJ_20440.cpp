/*
 백준 20440 🎵니가 싫어 싫어 너무 싫어 싫어 오지 마 내게 찝쩍대지마🎵 - 1
 21.09.18
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

int n;
vector <pii> mos;
set <int> timeSet;
vector <int> idx;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
//    freopen("input.txt", "r", stdin);

    cin >> n;
    for (int i = 0; i < n; ++i) {
        int s, e; cin >> s >> e;

        mos.push_back({s, e});
//        timeSet.insert(s);
//        timeSet.insert(e);
        idx.push_back(s);
        idx.push_back(e);
    }

//    vector <int> idx(timeSet.begin(), timeSet.end());
//    idx.assign(timeSet.begin(), timeSet.end());
//    sort(idx.begin(), idx.end());

    sort(idx.begin(), idx.end());
    idx.erase(unique(idx.begin(), idx.end()), idx.end());

    vector <int> prefixSum(idx.size());

    for (auto &p : mos) {
        int s = lower_bound(idx.begin(), idx.end(), p.first) - idx.begin();
        int e = lower_bound(idx.begin(), idx.end(), p.second) - idx.begin();

//        for (int i = s; i < e; ++i) prefixSum[i]++;
        ++prefixSum[s], --prefixSum[e];
    }

    for (int i = 1; i < prefixSum.size(); ++i) prefixSum[i] += prefixSum[i - 1];

    int cnt = 0, start = 0, end = 0;
    bool flag = false;

    for (int i = 0; i < prefixSum.size(); ++i) {

//        if (prefixSum[i] > cnt) {
//            cnt = prefixSum[i];
//            start = i;
//            end = i;
//            flag = true;
//        } else if (flag && prefixSum[i] < cnt) {
//            end = i;
//            flag = false;
//        }

        if (prefixSum[i] > cnt) {
            start = i;
            end = i;
            cnt = prefixSum[i];
        }
        if (prefixSum[i] == cnt && i - 1 == end) {
            end = i;
        }
    }

    cout << cnt << "\n" << idx[start] << " " << idx[end + 1] << endl;

    return 0;
}