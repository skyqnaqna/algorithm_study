/*
 백준 2021 최소 환승 경로
 21.08.18
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

const int MAX = 100001;

int n, m, from, to, distances[MAX]; // 역간 거리
vector <vector <int> > stations, lines;
bool visited[MAX]; // 노선 방문 체크

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m;
    stations.resize(n + 1, vector<int>());
    lines.resize(m, vector<int>());
    fill(distances, distances + MAX, INF);

    for (int i = 0; i < m; ++i) {
        int x; cin >> x;
        while (x != -1) {
            stations[x].push_back(i); // 해당 역엔 노선정보 넣기
            lines[i].push_back(x); // 해당 노선엔 역 정보 넣기
            cin >> x;
        }
    }

    cin >> from >> to;

    priority_queue<pii>pq;

    // 시작 역과 해당 노선에 있는 역들의 거리 초기화
    for (auto &line : stations[from]) {
        visited[line] = true;
        for (auto &station : lines[line]) {
            distances[station] = 0;
            pq.push({0, station});
        }
    }

    while (!pq.empty()) {
        int dist = -pq.top().first;
        int now = pq.top().second;
        pq.pop();

        if (dist > distances[now]) continue;

        for (auto &line : stations[now]) {
            if (!visited[line]) {
                visited[line] = true;

                // 방문하지 않은 노선이라면 해당 노선의 역들의 거리를 갱신해준다
                for (auto &station : lines[line]) {
                    if (dist + 1 < distances[station]) {
                        distances[station] = dist + 1;
                        pq.push({-(dist + 1), station});
                    }
                }
            }
        }
    }

    if (distances[to] < INF) cout << distances[to] << endl;
    else cout << -1 << endl;

    return 0;
}