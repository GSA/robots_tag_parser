require "spec_helper"

RSpec.describe RobotsTagParser do
  it "has a version number" do
    expect(RobotsTagParser::VERSION).not_to be nil
  end

  describe '.get_rules' do
    let(:headers) { { "x-robots-tag" => "noindex" } }
    subject(:get_rules) { RobotsTagParser.get_rules(headers: headers) }

    it 'returns the rules as an array' do
      expect(get_rules).to eq ['noindex']
    end

    context 'when multiple rules are included' do
      let(:headers) { { "x-robots-tag" => "noindex,nofollow" } }

      it 'returns the rules as an array' do
        expect(get_rules).to eq ['noindex', 'nofollow']
      end
    end

    context 'when the keys are not downcased' do
      let(:headers) { { 'X-Robots-Tag' => 'nofollow' } }

      it 'is not case-sensitive' do
        expect(get_rules).to eq ['nofollow']
      end
    end

    context 'when no X-Robots-Tag header is present' do
      let(:headers) { { 'foo' => 'bar' } }

      it 'returns an empty array' do
        expect(get_rules).to eq []
      end
    end

    context 'when rules exist for specific user agents' do
      let(:headers) do
        { 'x-robots-tag' => ['noindex', 'googlebot: noarchive', 'bingbot: nofollow'] }
      end

      context 'when no user agent is specified' do
        it 'returns generic rules' do
          expect(get_rules).to eq ['noindex']
        end
      end

      context 'when a user agent is specified' do
        it 'returns rules for that agent plus generic rules' do
          expect(RobotsTagParser.get_rules(headers: headers, user_agent: 'googlebot')).
            to eq ['noindex', 'noarchive']
        end
      end
    end
  end
end
