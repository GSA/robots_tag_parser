require "robots_tag_parser/version"

module RobotsTagParser
  def self.get_rules(headers:, user_agent: nil)
    rules = downcase_keys(headers)['x-robots-tag']
    return [] unless rules
    hash_of(rules).values_at('all', user_agent).compact.flatten.uniq
  end

  def self.downcase_keys(hash)
    new_hash = {}
    hash.each_pair{ |key, val| new_hash[key.downcase] = val }
    new_hash
  end

  def self.hash_of(rules)
    rules = (rules.is_a? String) ? [rules] : rules
    rules.map!{ |rule| RuleParser.parse(rule) }.reduce(&:merge)
  end

  class RuleParser
    def self.parse(rule_string)
      rule = rule_string.downcase.split(/: */)
      user_agent, rules = (rule.length == 1 ? 'all' : rule[0]), rule.last
      rules = rules.split(',').map(&:strip)
      Hash[[[user_agent, rules]]]
    end
  end
end
