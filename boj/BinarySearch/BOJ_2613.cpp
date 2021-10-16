/*
 21.10.16
 백준 2613 숫자구슬
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
#define TXTOPEN freopen("input.txt", "r", stdin)

int n, m;
vector <int> beads, group;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m;


    int sum = 0;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        beads.push_back(x);
        sum += x;
    }

    int left = *max_element(beads.begin(), beads.end());
    int right = sum, answer = sum;

    while (left <= right) {
        int mid = (left + right) / 2;

        vector <int> tempGroup;
        int cnt = 1, tempSum = beads[0], beadCnt = 1;
        for (int i = 1; i < n; ++i) {
            if (tempSum + beads[i] <= mid) {
                tempSum += beads[i];
                ++beadCnt;
            } else {
                ++cnt;
                tempSum = beads[i];
                tempGroup.push_back(beadCnt);
                beadCnt = 1;
            }
        }
        tempGroup.push_back(beadCnt);

        if (cnt > m) {
            left = mid + 1;
        } else {
            right = mid - 1;

            if (mid < answer) {
                answer = mid;

                // 그룹의 수가 부족하면 더 나눠주기
                if (tempGroup.size() < m) {
                    // 필요한 그룹 수
                    int diff = m - tempGroup.size();

                    while (diff != 0) {
                        vector <int> divided;
                        int idx = 0;
                        while (idx < tempGroup.size()) {
                            if (diff == 0) break;
                            if (tempGroup[idx] > 1) {
                                divided.push_back(1);
                                divided.push_back(tempGroup[idx] - 1);
                                --diff;
                            } else divided.push_back(tempGroup[idx]);

                            ++idx;
                        }

                        for (int i = idx; i < tempGroup.size(); ++i) divided.push_back(tempGroup[i]);

                        tempGroup = divided;
                    }
                }
                group = tempGroup;
            }
        }
    }

    cout << answer << endl;
    for (auto &res : group) cout << res << " ";

    return 0;
}