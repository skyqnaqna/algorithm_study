/*----------------------
|프로그래머스 K번째수
|21.02.01
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

using namespace std;

bool compare (string a, string b)
{
    if (a.length() == b.length())
        return a > b;
    else return a + b > b + a;
}

string solution(vector<int> numbers) {
    string answer = "";
    vector <string> strNums;
    for (int i = 0; i < numbers.size(); ++i)
    {
        strNums.push_back(to_string(numbers[i]));
    }
    sort(strNums.begin(), strNums.end(), compare);
    for (int i = 0; i < strNums.size(); ++i)
    {
        if (answer == "" && strNums[i] == "0") continue;
        answer += strNums[i];
    }
    if (answer == "") answer = "0";
    return answer;
}

int main()
{
    string a = "10";
    string b = "1";

    cout << a + b << " " << b + a << "\n";
    cout << (a + b > b + a) << "\n";
    vector<int> num = {0,0,0,0};
    cout << solution(num) << "\n";

    return 0;
}