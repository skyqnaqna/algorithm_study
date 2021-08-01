/*
 백준 1477 휴게소 세우기
 21.08.01
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 2e9
#define endl "\n"

int n, m, l, ans = INF;
vector <int> h, dist;

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m >> l;

    for (int i = 0; i < n; ++i) {
        int x; cin >> x;
        h.push_back(x);
    }
    h.push_back(l); // 고속도로 맨 끝부분 추가

    sort(h.begin(), h.end());

    dist.push_back(h[0]); // 0(고속도로 시작점) ~ 첫번째 휴게소 거리 추가

    for (int i = 1; i <= n; ++i) {
        dist.push_back(h[i] - h[i-1]); // 휴게소 간 거리 넣기
    }

    sort(dist.begin(), dist.end(), greater<>());

    int mid, left = 1, right = dist[0];

    while (left <= right) {
        mid = (left + right) / 2; // mid는 구간의 최댓값

        int cnt = 0;
        for (auto &d : dist) {
            if (d > mid) { // 같으면 휴게소 추가 안해도 됨
                cnt += d / mid;
                if (d % mid == 0) { // 나머지가 0인 경우는 구간 길이가 딱 들어맞기 때문에 이미 존재하는 휴게소와 겹침
                    --cnt;
                }
            }
        }

        if (cnt > m) left = mid + 1;
        else {
            ans = min(ans, mid);
            right = mid - 1;
        }
    }

    cout << ans << endl;

    return 0;
}